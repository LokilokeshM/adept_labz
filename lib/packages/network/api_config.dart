const Duration timeout = Duration(milliseconds: 60 * 1000);
const String baseUrl = "https://jsonplaceholder.typicode.com";

enum APIFlavor { dev, qa, stage, stageBlue, prod }

String apiFlavorString(APIFlavor value) {
  return value.toString().split('.').last;
}

class ApiConfig {
  static late APIFlavor apiFlavor;

  static void init(APIFlavor flavor) {
    apiFlavor = flavor;
  }

  static String get apiBaseUrl {
    switch (apiFlavor) {
      default:
        return baseUrl;
    }
  }
}
