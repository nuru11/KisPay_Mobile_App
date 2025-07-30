import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettleFundController extends GetxController {
  var availableBalance = 23500.00.obs;

  var settlements = <Map<String, dynamic>>[].obs;

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    settlements.addAll([
      {
        'date': '2025-07-25',
        'amount': 5000.00,
        'description': 'Weekly payout'
      },
      {
        'date': '2025-07-18',
        'amount': 3500.00,
        'description': 'Sales settlement'
      },
      {
        'date': '2025-07-10',
        'amount': 4200.00,
        'description': 'Manual withdrawal'
      },
    ]);
  }

  void settleNow() {
    final amount = double.tryParse(amountController.text);
    final description = descriptionController.text;

    if (amount != null && amount <= availableBalance.value) {
      settlements.insert(0, {
        'date': DateTime.now().toString().split(" ").first,
        'amount': amount,
        'description': description.isEmpty ? 'Manual settlement' : description,
      });

      availableBalance.value -= amount;
      amountController.clear();
      descriptionController.clear();
      Get.back();
    } else {
      Get.snackbar("Error", "Invalid or insufficient amount",
          backgroundColor: Colors.red.shade400, colorText: Colors.white);
    }
  }
}
