import 'package:Flutter_Boilerplate/core/database/database.dart';
import 'package:Flutter_Boilerplate/core/database/sqflite_database.dart';
import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseMock extends Mock implements Database{}
class MockDataBaseException extends DatabaseException {
  MockDataBaseException(String message) : super(message);
  @override
  int getResultCode() => 0;
}
class ModelTest {
  final String name;
  final int age;
  ModelTest({this.name, this.age});

  Map<String, dynamic> toMap(){
    return {
      "Name": this.name,
      "Age": this.age
    };
  }
}

void main(){
  DatabaseMock databaseMock;
  ADataBase<ModelTest> sqfliteDatabase;
  ModelTest modelTest;

  setUp((){
    databaseMock = DatabaseMock();
    sqfliteDatabase = SqfliteDataBase<ModelTest>(database: databaseMock);
    modelTest = ModelTest(name: "'Pub Dev'", age: 26);
  });

  group('Creation Tests', (){
    test('should create a new table ModelTest when it pass the correct parameters', () async{
      //arrange
      when(databaseMock.execute(any)).thenAnswer((realInvocation) => Future.value(null));
      final parameters = [
        'ID INTEGER Primary Key',
        'Name TEXT',
        'Age INTEGER'
      ];
      //act
      await sqfliteDatabase.create(parameters);
      //assert
      verify(databaseMock.execute(any));
      verifyNoMoreInteractions(databaseMock);
    });

    test('should return a SqlfiteException when the database has any error', () async{
      //arrange
      when(databaseMock.execute(any)).thenThrow(MockDataBaseException('Column name'));
      final parameters = [
        'ID INTEGER Primary Key',
        'Name TEXT',
        'Age INTEGER'
      ];
      //act
      //assert
      expect(() async => await sqfliteDatabase.create(parameters), throwsA(isA<SqfliteException>()));
    });

    test('should return a SqfliteException when the parameter is null', () async{
      //arrange
      when(databaseMock.execute(any)).thenAnswer((realInvocation) => Future.value(null));
      //act
      //assert
      verifyNoMoreInteractions(databaseMock);
      expect(() async => await sqfliteDatabase.create(null), throwsA(isA<SqfliteException>()));
    });
  });

  group('Insert Tests', (){
    test('should insert a new ModelTest when it pass the correct parameters', () async{
      //arrange
      when(databaseMock.rawInsert(any)).thenAnswer((realInvocation) => Future.value(1));
      //act
      await sqfliteDatabase.save(modelTest.toMap());
      //assert
      verify(databaseMock.rawInsert(any));
      verifyNoMoreInteractions(databaseMock);
    });
  });

  group('Delete Tests', (){
    test('should delete a ModelTest when it pass the correct parameters', () async{
      //arrange
      when(databaseMock.rawDelete(any, any)).thenAnswer((realInvocation) => Future.value(1));
      //act
      await sqfliteDatabase.delete(modelTest.toMap());
      //assert
      verify(databaseMock.rawDelete(any, any));
      verifyNoMoreInteractions(databaseMock);
    });
  });

  group('Select Tests', (){
    test('should return a ModelTest when it pass the correct parameters to select', () async{
      //arrange
      when(databaseMock.rawQuery(any, any)).thenAnswer((realInvocation) => Future.value([modelTest.toMap()]));
      //act
      final items = await sqfliteDatabase.select(modelTest.toMap());
      //assert
      expect(items[0], modelTest.toMap());
      verify(databaseMock.rawQuery(any, any));
      verifyNoMoreInteractions(databaseMock);
    });
  });
}