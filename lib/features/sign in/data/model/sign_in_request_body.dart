class SignInRequestBody {
  final String email;
  final String password;

  SignInRequestBody({
    required this.email,
    required this.password,
  });

  // بنكتب الميثود دي بإيدنا عشان نحول الكلاس لـ Map 
  // لأن Dio بياخد Map ويبعتها للسيرفر كـ JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}