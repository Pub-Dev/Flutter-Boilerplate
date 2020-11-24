import 'dart:convert';
import 'package:Flutter_Boilerplate/core/cryptography/cryptography_service.dart';
import 'package:Flutter_Boilerplate/core/environment/app_configuration.dart';
import 'package:Flutter_Boilerplate/core/environment/flavor.dart';
import 'package:Flutter_Boilerplate/core/http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class HttpClientMock extends Mock implements http.Client {}
class AESCryptographyServiceMock extends Mock implements ACryptographyService {}

void main(){
  HttpClientMock httpMock;
  Http httpService;
  AESCryptographyServiceMock cryptographyServiceMock;
  setUp((){
    AppConfig().initialize(DevelopmentFlavor());
    cryptographyServiceMock = AESCryptographyServiceMock();
    httpMock = HttpClientMock();
    httpService = Http(client: httpMock, cryptographyService: cryptographyServiceMock);
  });
  group('Method GET', (){
    final Map<String, String> headers = Map<String, String>();
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    final Map<String, dynamic> tResponse = {'teste': 'teste'};
    test('should return a map<String,dynamic> when the status is successful.', () async {
      //arrange
      when(httpMock.get(any, headers: headers)).thenAnswer((realInvocation) async => http.Response(jsonEncode(tResponse), 200));
      when(cryptographyServiceMock.decrypt(any)).thenReturn('teste');
      //act
      var result = await httpService.get('urlTeste/1');
      //assert
      expect(result, tResponse);
      verify(httpMock.get(any, headers: headers));
      verifyNoMoreInteractions(httpMock);
    });
  });

  group('Method POST', (){
    final Map<String, String> headers = Map<String, String>();
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    final Map<String, dynamic> tResponse = {'teste': 'teste'};
    final Map<String, dynamic> tRequest = {'teste': 'teste'};

    test('should return a map<String,dynamic> when the status is successful.', () async {
      //arrange
      when(httpMock.post(any, body: jsonEncode(tRequest), headers: headers)).thenAnswer((realInvocation) async => http.Response(jsonEncode(tResponse), 200));
      when(cryptographyServiceMock.decrypt(any)).thenReturn('teste');
      //act
      var result = await httpService.post('urlTeste', tRequest);
      //assert
      expect(result, tResponse);
      verify(httpMock.post(any, body: jsonEncode(tRequest), headers: headers));
      verifyNoMoreInteractions(httpMock);
    });
  });
}