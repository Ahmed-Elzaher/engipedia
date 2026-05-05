import 'package:dio/dio.dart';
import 'package:engipedia/features/sign_in/data/model/sign_in_request_body.dart';
import 'api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  /// ميثود تسجيل الدخول اليدوية باستخدام Dio
  Future<dynamic> login(SignInRequestBody signInRequestBody) async {
    try {
      // بنستخدم الـ Dio مباشرة لعمل طلب POST
      // بنجيب الـ URL من ملف الـ ApiConstants اللي عملناه
      final response = await _dio.post(
        "${ApiConstants.apiBaseUrl}${ApiConstants.login}",
        data: signInRequestBody.toJson(),
      );

      // Dio بيقوم بتحويل الـ JSON لـ Map بشكل تلقائي في response.data
      return response.data;
    } on DioException catch (e) {
      // التعامل مع أخطاء Dio (مثل انقطاع الإنترنت أو خطأ من السيرفر)
      throw Exception(e.message ?? "حدث خطأ أثناء الاتصال بالسيرفر");
    } catch (e) {
      // التعامل مع أي خطأ غير متوقع
      throw Exception("خطأ غير متوقع: $e");
    }
  }

  /// يمكنك إضافة أي ميثود أخرى هنا بنفس الطريقة (مثل الـ SignUp)
  Future<dynamic> signUp(dynamic signUpRequestBody) async {
    try {
      final response = await _dio.post(
        "${ApiConstants.apiBaseUrl}${ApiConstants.signUp}",
        data: signUpRequestBody.toJson(),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message ?? "حدث خطأ أثناء إنشاء الحساب");
    }
  }
}
