import 'dart:convert';
import 'package:Flutter_Boilerplate/core/cryptography/cryptography_service.dart';
import 'package:Flutter_Boilerplate/core/environment/app_configuration.dart';
import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class AHttp {
  Future<Map<String,dynamic>> post(String actionUrl, Map<String, dynamic> body, [Map<String, String> headers]);
  Future<Map<String,dynamic>> get(String actionUrl, [Map<String, String> headers]);
}

class Http implements AHttp {
  final ACryptographyService cryptographyService;
  final String _baseUrlEncrypted = AppConfig.flavor.baseUrl;
  final http.Client client;

  Map<String,String> get _baseHeader => {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  String get _baseUrl => cryptographyService.decrypt<String>(_baseUrlEncrypted);

  Http({@required this.client, @required this.cryptographyService});
  
  @override
  Future<Map<String,dynamic>> post(String actionUrl, Map<String, dynamic> body, [Map<String, String> headers]) async {
    final response = await client.post('$_baseUrl/$actionUrl', headers: _getHeaders(add: headers), body: jsonEncode(body));
    _validate(response.statusCode);
    return jsonDecode(response.body);
  }

  @override
  Future<Map<String,dynamic>> get(String actionUrl, [Map<String, String> headers]) async {
    final response = await client.get('$_baseUrl/$actionUrl', headers: _getHeaders(add: headers));
    _validate(response.statusCode);
    return jsonDecode(response.body);
  }

  Future<void> _validate(int responseCode){
    if(responseCode >= 200 && responseCode < 299) 
      return null;
    else
      throw ServerException();
  }

  Map<String, String> _getHeaders({Map<String, String> add}){
    var allHeaders = _baseHeader;
    if(add != null)
      allHeaders = {..._baseHeader, ...add};
    return allHeaders;
  }
}