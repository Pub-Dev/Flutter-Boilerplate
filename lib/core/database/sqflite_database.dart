import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class SqfliteDataBase<T> extends ADataBase<T>{

  Database database;

  SqfliteDataBase({this.database});

  Future<Database> _getDataBase() async{
    if(this.database != null) return this.database;
    final dbPath = await getDatabasesPath();
    this.database = await openDatabase(join(dbPath, 'database.db'), version: 1);
    return this.database;
  }

  @override
  Future<void> create(List<String> parameters) async {
    try{
      final database = await _getDataBase();
      await database.execute('CREATE TABLE ${T.runtimeType.toString()} (${parameters.reduce((value, element) => '$value,$element = ?,')})');
    } on DatabaseException catch(ex){
      throw SqfliteException(ex.toString());
    } on NoSuchMethodError catch(ex){
      throw SqfliteException(ex.toString());
    } on StateError catch(ex){
      throw SqfliteException(ex.message);
    } on Exception catch(ex){
      throw ex;
    }    
  }
  
  @override
  Future<void> save(Map<String, dynamic> parameters) async {
    final database = await _getDataBase();
    await database.rawInsert('INSERT OR REPLACE INTO ${T.runtimeType.toString()}(${parameters.keys.reduce((value, element) => '$value,$element')}) VALUES (${parameters.values.reduce((value, element) => '$value,$element')})');
  }

  @override
  Future<void> delete(Map<String, dynamic> where) async {
    final database = await _getDataBase();
    await database.rawDelete('DELETE FROM ${T.runtimeType.toString()} WHERE ${where.keys.reduce((value, element) => '$value = ?,$element = ?,')}', where.values.toList());
  }
  
  @override
  Future<List<Map<String, dynamic>>> select(Map<String, dynamic> where) async {
    final database = await _getDataBase();
    return await database.rawQuery('SELECT * FROM ${T.runtimeType.toString()} WHERE ${where.keys.reduce((value, element) => '$value = ?,$element = ?,')}', where.values.toList());
  }
}