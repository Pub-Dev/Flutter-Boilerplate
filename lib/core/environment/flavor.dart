abstract class Flavor{
  String appName;
  String baseUrl;
  String aesCriptographyKey;
  String aesCriptographyIV;
}

class DevelopmentFlavor implements Flavor {
  //IV da Criptografia AES criptografada em Base64 (hfj972H&f23K41x=)
  @override
  String aesCriptographyIV = "aGZqOTcySCZmMjNLNDF4PQ==";

  //Chave da Criptografia AES Criptografada em Base64 (A7=erP@,n2e0fm34/5f4FE#6Anfi82ql)
  @override
  String aesCriptographyKey = "QTc9ZXJQQCxuMmUwZm0zNC81ZjRGRSM2QW5maTgycWw=";

  // App Name
  @override
  String appName = "Template Development";

  //Url base criptografada https://5f1845057c06c900160dccd0.mockapi.io/api/v1
  @override
  String baseUrl = "u72GXlRQe9yTmj7jXKrcaIrny13e927oZj31zZw5RjIdZi/FMMxbi6LkF3ItM/JabcCkciXcJlCZYb926BFQSQ==";
}

class HomologationFlavor implements Flavor {
  //IV da Criptografia AES criptografada em Base64 (hfj972H&f23K41x=)
  @override
  String aesCriptographyIV = "aGZqOTcySCZmMjNLNDF4PQ==";

  //Chave da Criptografia AES Criptografada em Base64 (A7=erP@,n2e0fm34/5f4FE#6Anfi82ql)
  @override
  String aesCriptographyKey = "QTc9ZXJQQCxuMmUwZm0zNC81ZjRGRSM2QW5maTgycWw=";

  // App Name
  @override
  String appName = "Template Homologation";

  //Url base criptografada https://5f1845057c06c900160dccd0.mockapi.io/api/v1
  @override
  String baseUrl = "u72GXlRQe9yTmj7jXKrcaIrny13e927oZj31zZw5RjIdZi/FMMxbi6LkF3ItM/JabcCkciXcJlCZYb926BFQSQ==";
}

class ProductionFlavor implements Flavor {
  //IV da Criptografia AES criptografada em Base64 (hfj972H&f23K41x=)
  @override
  String aesCriptographyIV = "aGZqOTcySCZmMjNLNDF4PQ==";

  //Chave da Criptografia AES Criptografada em Base64 (A7=erP@,n2e0fm34/5f4FE#6Anfi82ql)
  @override
  String aesCriptographyKey = "QTc9ZXJQQCxuMmUwZm0zNC81ZjRGRSM2QW5maTgycWw=";

  // App Name
  @override
  String appName = "Template Production";

  //Url base criptografada https://5f1845057c06c900160dccd0.mockapi.io/api/v1
  @override
  String baseUrl = "u72GXlRQe9yTmj7jXKrcaIrny13e927oZj31zZw5RjIdZi/FMMxbi6LkF3ItM/JabcCkciXcJlCZYb926BFQSQ==";
}