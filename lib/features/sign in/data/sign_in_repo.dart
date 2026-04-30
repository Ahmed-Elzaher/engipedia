import '../../../../core/networking/api_service.dart';
import '../data/model/sign_in_request_body.dart';

class SignInRepo {
  final ApiService _apiService;

  SignInRepo(this._apiService);

  /// وظيفة الميثود دي إنها تنادي على الـ ApiService وتجيب النتيجة
  Future<dynamic> login(SignInRequestBody signInRequestBody) async {
    try {
      // بننادي على ميثود الـ login اللي عملناها في الـ ApiService
      final response = await _apiService.login(signInRequestBody);
      return response;
    } catch (error) {
      // بنرمي الخطأ عشان الـ Cubit يمسكه ويعرضه لليوزر
      rethrow;
    }
  }
}