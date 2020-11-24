import 'package:Flutter_Boilerplate/core/cryptography/aes_criptography_service.dart';
import 'package:Flutter_Boilerplate/core/cryptography/cryptography_service.dart';
import 'package:Flutter_Boilerplate/core/environment/app_configuration.dart';
import 'package:Flutter_Boilerplate/core/environment/flavor.dart';
import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:Flutter_Boilerplate/core/json/json_model.dart';
import 'package:flutter_test/flutter_test.dart';

class ObjectTest implements JsonModel{
  final name = 'Rafael';
  final age = 27;

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age
    };
  }
}

void main(){
  final String tText = 'teste';
  final tObject = ObjectTest();
  final tObjectMapped = {'name': 'Rafael', 'age': 27};
  final tTextEncrypted = 'diIY1NiaC8QeinGjMS8P2w==';
  final tObjectEncrypted = '1ApapL0E0psPVE2Z54zNfzEicsfTIbdz5wI1ih1MMNw=';

  ACryptographyService criptographyService;

  setUp((){
    AppConfig().initialize(DevelopmentFlavor());
    criptographyService = AESCriptographyService();
  });

  group('Encrypt', (){
    test('should encript the object when the object is a String', (){
      //arrange
      //act
      var encrypted = criptographyService.encrypt(tText);
      //assert
      expect(encrypted, tTextEncrypted);
    });

    test('should encript the object when the object is a dynamic', (){
      //arrange
      //act
      var encrypted = criptographyService.encrypt(tObjectMapped);
      //assert
      expect(encrypted, tObjectEncrypted);
    });

    test('should return CriptException when the parameter is null', (){
      //arrange
      //act
      //assert
      expect(() => criptographyService.encrypt(null), throwsA(isA<CriptException>()));
    });

    test('should return CriptException when the parameter is null and string Type', (){
      //arrange
      //act
      final String text = null;
      //assert
      expect(() => criptographyService.encrypt(text), throwsA(isA<CriptException>()));
    });

    test('should return CriptException when the parameter is a empty string', (){
      //arrange
      //act
      final String text = "";
      //assert
      expect(() => criptographyService.encrypt(text), throwsA(isA<CriptException>()));
    });

    test('should return CriptException when the parameter is a INTEGER', (){
      //arrange
      //act
      //assert
      expect(() => criptographyService.encrypt(123454), throwsA(isA<CriptException>()));
    });

    test('should encript the object when the object implement JsonModel', (){
      //arrange
      //act
      final encrypted = criptographyService.encrypt(tObject);
      //assert
      expect(encrypted, tObjectEncrypted);
    });
  });

  group('Decrypt', (){
    test('should decrypt the hash and convert to string', (){
      //arrange
      //act
      var decrypted = criptographyService.decrypt<String>(tTextEncrypted);
      //assert
      expect(decrypted, tText);
    });

    test('should decrypt the hash and convert to object', (){
      //arrange
      //act
      var decrypted = criptographyService.decrypt<Map<String, dynamic>>(tObjectEncrypted);
      //assert
      expect(decrypted, tObjectMapped);
    });

    test('should return CriptException when the parameter is null', (){
      //arrange
      //act
      //assert
      expect(() => criptographyService.decrypt<String>(null), throwsA(isA<CriptException>()));
    });

    test('should return CriptException when the parameter is a empty string', (){
      //arrange
      //act
      final String text = "";
      //assert
      expect(() => criptographyService.decrypt<String>(text), throwsA(isA<CriptException>()));
    });

    test('should return CriptException when the return type is not the same of expected', (){
      //arrange
      //act
      //assert
      expect(() => criptographyService.decrypt<ObjectTest>(tTextEncrypted), throwsA(isA<CriptException>()));
    });
  });
}