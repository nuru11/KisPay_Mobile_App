// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class QRPaymentController extends GetxController {
//   final nameController = TextEditingController();
//   final amountController = TextEditingController();
//   final descriptionController = TextEditingController();

//   var qrData = ''.obs;

//   void generateQR() {
//     if (nameController.text.isNotEmpty && amountController.text.isNotEmpty) {
//       qrData.value = {
//         'name': nameController.text,
//         'amount': amountController.text,
//         'description': descriptionController.text,
//         'timestamp': DateTime.now().toIso8601String(),
//       }.toString();
//       Get.back();
//     } else {
//       Get.snackbar("Missing Fields", "Name and Amount are required",
//           backgroundColor: Colors.red, colorText: Colors.white);
//     }
//   }
// }





import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRPaymentController extends GetxController {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  var qrData = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Add dummy QR data on init
    qrData.value = {
      'name': 'John Doe',
      'amount': '250.00',
      'description': 'QR Payment for Coffee',
      'timestamp': DateTime.now().toIso8601String(),
    }.toString();
  }

  void generateQR() {
    if (nameController.text.isNotEmpty && amountController.text.isNotEmpty) {
      qrData.value = {
        'name': nameController.text,
        'amount': amountController.text,
        'description': descriptionController.text.isEmpty
            ? 'No description'
            : descriptionController.text,
        'timestamp': DateTime.now().toIso8601String(),
      }.toString();

      nameController.clear();
      amountController.clear();
      descriptionController.clear();
      Get.back();
    } else {
      Get.snackbar("Missing Fields", "Name and Amount are required",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
