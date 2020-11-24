abstract class ACryptographyService{
  String encrypt(object);
  T decrypt<T>(String encrypted);
}