class ApiConstants {
  // الرابط الأساسي للسيرفر (غيره لما الباك-إند يبعتوه)
  static const String apiBaseUrl = "https://jsonplaceholder.typicode.com/";

  // المسارات الخاصة بكل عملية
  static const String login = "posts";
  static const String signUp = "users";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
}
