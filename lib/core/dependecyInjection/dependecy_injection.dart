abstract class ADependencyInjection{
  static ADependencyInjection singleton;
  init();
  T get<T>([String nameInstance]);
}

