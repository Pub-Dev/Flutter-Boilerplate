import 'package:Flutter_Boilerplate/core/dependecyInjection/dependecy_injection.dart';
import 'package:Flutter_Boilerplate/core/dependecyInjection/get_it_dependency.dart';
import 'package:Flutter_Boilerplate/core/environment/app_configuration.dart';
import 'package:Flutter_Boilerplate/core/environment/flavor.dart';
import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:Flutter_Boilerplate/core/http/http.dart';
import 'package:flutter_test/flutter_test.dart';

class ClassTest {}

void main(){
  ADependencyInjection dependencyInjection = GetItDependency();

  AppConfig().initialize(DevelopmentFlavor());

  dependencyInjection.init();

  test('should return the HttpService when the get_it was initiated', (){
    //arrange
    //act
    AHttp httpServiceAbs = dependencyInjection.get<AHttp>(InstanceName.http);
    //assert
    expect(httpServiceAbs, isNotNull);
  });

  test('should return a DependencyInjectionException when the instanceName doesnt exist', (){
    //arrange
    //act
    //assert
    expect(() => dependencyInjection.get<AHttp>("abc123"), throwsA(isA<DependencyInjectionException>()));
  });

  test('should return a DependencyInjectionException when the object is not registered in getit', (){
    //arrange
    //act
    //assert
    expect(() => dependencyInjection.get<ClassTest>(), throwsA(isA<DependencyInjectionException>()));
  });
}