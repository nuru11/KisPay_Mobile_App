import 'package:flutter/material.dart';
import 'package:kispay_merchant/data/repositories/merchantDetails_respository.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';
import '../../core/services/secure_storage.dart';

class MerchantDetailsController extends GetxController {
  final AuthController controller = Get.find<AuthController>();

  
  
  final MerchantDetailsRepository merchantDetailsRepository;
  final SecureStorage secureStorage;
  final RxString FetchStatus = RxString('idle');
  final RxString errorMessage = RxString('');
  final RxString businessName = RxString('');
  final RxString phoneNumber = RxString('');
  final RxString middleName = RxString('');
  final RxString lastName = RxString('');
  final RxString firstName = RxString('');

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  MerchantDetailsController({
    required this.merchantDetailsRepository,
    required this.secureStorage,
  }) {
    print('MerchantDetail initialized');
    _loadStoredValues(); // Load stored values on initialization
  }



  Future<void> _loadStoredValues() async {
    try {
      final storedbusinessName = await secureStorage.read('business_name');
      final storedPhoneNumber = await secureStorage.read('phone_number');
      final storedMiddleName = await secureStorage.read('middle_name');
      final storedLastName = await secureStorage.read('last_name');
      final storedFirstName = await secureStorage.read('first_name');
      
      if (storedbusinessName != null) {
        businessName.value = storedbusinessName;
      }
      if (storedPhoneNumber != null) {
        phoneNumber.value = storedPhoneNumber;
      }
      if (storedMiddleName != null) {
        middleName.value = storedMiddleName;
      }
      if (storedLastName != null) {
        lastName.value = storedLastName;
      }
      if (storedFirstName != null) {
        firstName.value = storedFirstName;
      }
    } catch (e) {
      print('Error loading stored values: $e');
    }
  }

 Future<void> merchantDetails() async {
  try {
    FetchStatus.value = 'loading';
    errorMessage.value = '';
    
    // Read the token from secure storage
    final storedToken = await secureStorage.read('auth_token');
    

    print('Stored Tokenaaaaaaaaaaaa: $storedToken');
    
    // Check if the token is null or empty
    if (storedToken == null || storedToken.isEmpty) {
      throw Exception('Auth token is missing');
    }
    
    // Call the repository method with the retrieved token
    final response = await merchantDetailsRepository.merchantDetails(storedToken);


    print('Merchant Details Responsesssssssssssssssssssssssssssssssssssssssssss: $response');
    
    // Check if response is valid
    await secureStorage.write('business_name', response.businessName);
    businessName.value = response.businessName;
      await secureStorage.write('phone_number', response.phoneNumber);
    phoneNumber.value = response.phoneNumber;
  
    FetchStatus.value = 'success';
    // Get.offNamed('/MerchantDetailScreen');
  } catch (e) {
    FetchStatus.value = 'error';
    errorMessage.value = e.toString().replaceFirst('Exception: ', '');
    print('merchant error: ${errorMessage.value}');
    Get.snackbar('Error', errorMessage.value);
  }
}

Future<void> updateProfile({
  required String updatedFirstName,
  required String updatedMiddleName,
  required String updatedLastName,
}) async {
  try {
    FetchStatus.value = 'loading';
    errorMessage.value = '';

    final token = await secureStorage.read('auth_token');
    final userId = await secureStorage.read('id');

    if (token == null || userId == null) {
      throw Exception('Missing authentication info');
    }

    final response = await merchantDetailsRepository.updateProfile(
      token: token,
      userId: userId,
      firstName: updatedFirstName,
      middleName: updatedMiddleName,
      lastName: updatedLastName,
    );

    // Store updated info
    await secureStorage.write('first_name', response.firstName);
    await secureStorage.write('middle_name', response.middleName);
    await secureStorage.write('last_name', response.lastName);

    // Update AuthController values
    controller.firstName.value = response.firstName;
    controller.middleName.value = response.middleName;
    controller.lastName.value = response.lastName;
    controller.userName.value = '${response.firstName} ${response.lastName}';


    firstName.value = updatedFirstName;
  middleName.value = updatedMiddleName;
  lastName.value = updatedLastName;

  firstNameController.text = updatedFirstName;
  middleNameController.text = updatedMiddleName;
  lastNameController.text = updatedLastName;

    FetchStatus.value = 'success';
    Get.snackbar('Success', 'Profile updated successfully');
    merchantDetails(); // Refresh merchant details
  } catch (e) {
    FetchStatus.value = 'error';
    errorMessage.value = e.toString().replaceFirst('Exception: ', '');
    Get.snackbar('Error', errorMessage.value);
  }
}


  
}




