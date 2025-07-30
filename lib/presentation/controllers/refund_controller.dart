import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundController extends GetxController {
  var refunds = <Map<String, String>>[].obs;

  final transactionIdController = TextEditingController();
  final amountController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    refunds.addAll([
      {
        'transactionId': 'TXN123456',
        'amount': '150.00',
        'reason': 'Product returned',
        'date': '2025-07-28',
      },
      {
        'transactionId': 'TXN987654',
        'amount': '75.00',
        'reason': 'Duplicate charge',
        'date': '2025-07-22',
      },
      {
        'transactionId': 'TXN564738',
        'amount': '200.00',
        'reason': 'Service not delivered',
        'date': '2025-07-10',
      },
    ]);
  }

  void submitRefund() {
    if (transactionIdController.text.isNotEmpty &&
        amountController.text.isNotEmpty) {
      refunds.insert(0, {
        'transactionId': transactionIdController.text,
        'amount': amountController.text,
        'reason': reasonController.text.isEmpty
            ? 'No reason provided'
            : reasonController.text,
        'date': DateTime.now().toString().split(' ').first,
      });

      transactionIdController.clear();
      amountController.clear();
      reasonController.clear();

      Get.back();
    } else {
      Get.snackbar(
        'Missing Fields',
        'Transaction ID and Amount are required.',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
    }
  }
}
