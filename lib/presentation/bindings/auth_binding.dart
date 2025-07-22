import 'package:get/get.dart';
import '../../core/services/api_service.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/secure_storage.dart';
import '../../data/repositories/auth_respository.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => AuthService(apiService: Get.find()));
    Get.lazyPut(() => SecureStorage());
    Get.lazyPut(() => AuthRepository(authService: Get.find()));
    Get.lazyPut(() => AuthController(
          authRepository: Get.find(),
          secureStorage: Get.find(), 
        ));
  }
}