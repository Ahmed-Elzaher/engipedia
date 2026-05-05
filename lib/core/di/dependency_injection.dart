import 'package:engipedia/features/sign_in/data/sign_in_repo.dart';
import 'package:engipedia/features/sign_in/logic/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../networking/dio_factory.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Dio & DioFactory
  // بنجهز نسخة الـ Dio اللي هنستخدمها في الأبلكيشن كله
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // 2. ApiService
  // بنسجل الـ ApiService وبنخليه ياخد نسخة الـ Dio اللي سجلناها فوق
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // 3. SignIn Repo
  // بنسجل الـ Repo وبنخليه ياخد نسخة الـ ApiService الجاهزة من getIt
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(getIt<ApiService>()));

  // 4. SignIn Cubit
  // بنستخدم registerFactory هنا عشان كل ما نفتح صفحة الـ Sign In يعمل Cubit جديد ويمسحه لما نقفلها
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt<SignInRepo>()));
}