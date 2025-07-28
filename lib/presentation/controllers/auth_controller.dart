import 'package:kispay_merchant/data/repositories/auth_respository.dart';
import 'package:get/get.dart';
import '../../core/services/secure_storage.dart';


class AuthController extends GetxController {
  final AuthRepository authRepository;
  final SecureStorage secureStorage;
  final RxString loginStatus = RxString('idle');
  final RxString forgetpasswordStatus = RxString('idle');
  final RxString registerStatus = RxString('idle');
  final RxString resendEmailConfirmationStatus = RxString('idle');
  final RxString errorMessage = RxString('');
  final RxString userName = RxString('');
  final RxString firstName = RxString('');
  final RxString email = RxString('');
  final RxString role = RxString('');
  final RxString id = RxString('');
  final RxString forgetPasswordMessage = RxString('');

  AuthController({
    required this.authRepository,
    required this.secureStorage,
  }) {
    _loadStoredValues(); 
  }



  Future<void> _loadStoredValues() async {
    try {
      final storedFirstName = await secureStorage.read('first_name');
      final storedLastName = await secureStorage.read('last_name');
      final storedEmail = await secureStorage.read('email');
      final storedRole = await secureStorage.read('role');
      final storedId = await secureStorage.read('id');


      if (storedFirstName != null) {
        firstName.value = storedFirstName;
      }
      if (storedLastName != null && storedFirstName != null) {
        userName.value = '$storedFirstName $storedLastName';
      }
      if (storedEmail != null) {
        // Assuming you want to store email in a variable, but it's not used in the controller
        // You can add an RxString for email if needed
        email.value = storedEmail;
      }
      if (storedRole != null) {
        role.value = storedRole;
      }
      if (storedId != null) {
        id.value = storedId;
      }

    } catch (e) {
      throw Exception('Invalid Data');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      loginStatus.value = 'loading';
      errorMessage.value = '';
      final response = await authRepository.login(email, password);


      await secureStorage.write('auth_token', response.token);
      await secureStorage.write('first_name', response.firstName);
      await secureStorage.write('last_name', response.lastName);
      await secureStorage.write('email', response.email);
      await secureStorage.write('role', response.roles.isNotEmpty ? response.roles[0] : '');
      await secureStorage.write('id', response.id);

      firstName.value = response.firstName;
      userName.value = '${response.firstName} ${response.lastName}';
      role.value = response.roles.isNotEmpty ? response.roles[0] : '';
      id.value = response.id;
      this.email.value = response.email; // Store email in the controller



      loginStatus.value = 'success';
      Get.offNamed('/curve_bar');
    } catch (e) {
      loginStatus.value = 'error';
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      Get.snackbar('Error', errorMessage.value);
    }
  }

  Future<void> register(String firstName,  String middleName, String lastName, String email, String password ) async {
    try {
      registerStatus.value = 'loading';
      errorMessage.value = '';
      final response = await authRepository.register(firstName, middleName, lastName, email, password);
      
      // print('Registration successful: ${response}');



      registerStatus.value = 'success';
      Get.offNamed('/email_confirmation', arguments: {
  'firstName': response.firstName,
  'middleName': response.middleName,
  'lastName': response.lastName,
  'email': response.email,
});

    }  catch (e) {
      registerStatus.value = 'error';
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      Get.snackbar('Error', errorMessage.value);
    }
  }



  Future<void> resendConfirmationEmail( String email ) async {
    try {
      resendEmailConfirmationStatus.value = 'loading';
      errorMessage.value = '';
      final response = await authRepository.resendConfirmationEmail(email);
      



      resendEmailConfirmationStatus.value = 'success';
      Get.snackbar('successful', "verification email sent successfully");
      Get.offNamed('/email_confirmation', arguments: {
  'firstName': response.firstName,
  'middleName': response.middleName,
  'lastName': response.lastName,
  'email': response.email,
});

    }  catch (e) {
      resendEmailConfirmationStatus.value = 'error';
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      Get.snackbar('Error', errorMessage.value);
    }
  }




   Future<void> forgetPassword( String email ) async {
    try {
      forgetpasswordStatus.value = 'loading';
      errorMessage.value = '';
      forgetPasswordMessage.value = '';
      final response = await authRepository.forgetPassword(email);

      print("${response.message}   aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");  
      


      forgetPasswordMessage.value = response.message;
      forgetpasswordStatus.value = 'success';
      Get.snackbar('successful', "verification email sent successfully");
    

    }  catch (e) {
      forgetpasswordStatus.value = 'error';
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      Get.snackbar('Error', errorMessage.value);
    }
  }




  Future<void> signOut() async {
  try {
    await secureStorage.deleteAll();

    userName.value = '';
    firstName.value = '';
    role.value = '';
    id.value = '';


    Get.offAllNamed('/login');
  } catch (e) {
    Get.snackbar('Error', 'Sign out failed: $e');
  }
}

  void signUp(String trim, String trim2) {}



  bool isUserLoggedIn() {
    return id.value.isNotEmpty; // Check if user ID is available
    
  }

}




