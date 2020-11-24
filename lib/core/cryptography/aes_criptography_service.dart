import 'dart:convert';
import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:Flutter_Boilerplate/core/json/json_model.dart';
import 'package:encrypt/encrypt.dart';
import 'package:Flutter_Boilerplate/core/environment/app_configuration.dart';

import 'cryptography_service.dart';

class AESCriptographyService extends ACryptographyService{
  final key = Key.fromBase64(AppConfig.flavor.aesCriptographyKey);
  final iv = IV.fromBase64(AppConfig.flavor.aesCriptographyIV);
  Encrypter encrypter;

  AESCriptographyService(){
    encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  }

  @override
  T decrypt<T>(String encrypted) {
    try{
      var decrypted = encrypter.decrypt64(encrypted, iv: iv);
      if(T == String)
        return decrypted as T;
      else 
        return jsonDecode(decrypted) as T;
    } on RangeError catch(ex){
      throw CriptException(ex.message);
    } on NoSuchMethodError catch(ex){
      throw CriptException(ex.toString());
    } on FormatException catch(ex){
      throw CriptException(ex.message);
    } on Exception catch(ex){
      throw ex;
    }
  }
  
  @override
  String encrypt(object) {
    try{
      if(object is String)
        return encrypter.encrypt(object, iv: iv).base64;
      else if(object is Map<String,dynamic>)
        return encrypter.encrypt(jsonEncode(object), iv: iv).base64;
      else if(object is JsonModel)
        return encrypter.encrypt(jsonEncode(object.toMap()), iv: iv).base64;
      else
        throw FormatException("Formato de Criptografia invalida: ${object.runtimeType}");
    } on RangeError catch(ex){
      throw CriptException(ex.message);
    } on FormatException catch(ex){
      throw CriptException(ex.message);
    } on Exception catch(ex){
      throw ex;
    }
  }
}