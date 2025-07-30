import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentLinkController extends GetxController {
  var links = <Map<String, String>>[].obs;

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Dummy data
    links.addAll([
      {
        'name': 'Monthly Subscription',
        'amount': '299',
        'description': 'Access to premium features'
      },
      {
        'name': 'Event Ticket',
        'amount': '150',
        'description': 'Entry to Business Expo 2025'
      },
      {
        'name': 'Consultation Fee',
        'amount': '500',
        'description': '1-hour business consultation'
      },
      {
        'name': 'Donation',
        'amount': '100',
        'description': 'Support our development fund'
      },
    ]);
  }

  void createLink() {
    if (nameController.text.isNotEmpty && amountController.text.isNotEmpty) {
      links.add({
        'name': nameController.text,
        'amount': amountController.text,
        'description': descriptionController.text
      });

      nameController.clear();
      amountController.clear();
      descriptionController.clear();

      Get.back();
    }
  }
}
