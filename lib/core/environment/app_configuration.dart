import 'flavor.dart';

class AppConfig {
  static Flavor _flavor;
  static Flavor get flavor => _flavor;
  
  initialize(Flavor flavor){
    _flavor = flavor;
  }
}