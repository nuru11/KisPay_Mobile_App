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
      
      if (storedbusinessName != null) {
        businessName.value = storedbusinessName;
      }
      if (storedPhoneNumber != null) {
        phoneNumber.value = storedPhoneNumber;
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
    if (response.businessName != null) {
      await secureStorage.write('business_name', response.businessName);
      businessName.value = response.businessName;
    } 
    if (response.phoneNumber != null) {
      await secureStorage.write('phone_number', response.phoneNumber);
      phoneNumber.value = response.phoneNumber;
    }
    else {
      throw Exception('Business name not found in response');
    }

    FetchStatus.value = 'success';
    // Get.offNamed('/MerchantDetailScreen');
  } catch (e) {
    FetchStatus.value = 'error';
    errorMessage.value = e.toString().replaceFirst('Exception: ', '');
    print('merchant error: ${errorMessage.value}');
    Get.snackbar('Error', errorMessage.value);
  }
}

  
}




