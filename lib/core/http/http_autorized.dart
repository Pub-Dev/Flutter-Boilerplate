import 'http.dart';

class HttpAutorized implements AHttp{
  final AHttp http;

  HttpAutorized({this.http});

  @override
  Future<Map<String, dynamic>> get(String actionUrl, [Map<String, String> headers]) {
    return this.http.get(actionUrl, headers);
  }
  
  @override
  Future<Map<String, dynamic>> post(String actionUrl, Map<String, dynamic> body, [Map<String, String> headers]) {
    return this.http.post(actionUrl, body, headers);
  }
}