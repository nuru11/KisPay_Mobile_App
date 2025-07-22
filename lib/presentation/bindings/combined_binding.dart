import 'package:kispay_merchant/presentation/bindings/merchantDetails_binding.dart';
import 'package:get/get.dart';
import 'auth_binding.dart';

class CombinedBinding extends Bindings {
  @override
  void dependencies() {
    AuthBinding().dependencies();
    MerchantDetailsBinding().dependencies();
  }
}