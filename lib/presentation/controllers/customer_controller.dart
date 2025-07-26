// controllers/customer_controller.dart
import 'package:get/get.dart';

class CustomerController extends GetxController {
  // Original full customer list
  final customers = <Map<String, dynamic>>[
    {
      'name': 'Samuel Bekele',
      'phone': '+251 911 234 567',
      'totalSpent': 'ETB 5,200',
    },
    {
      'name': 'Mekdes Daba',
      'phone': '+251 922 345 678',
      'totalSpent': 'ETB 2,880',
    },
    {
      'name': 'Daniel Tulu',
      'phone': '+251 933 456 789',
      'totalSpent': 'ETB 7,000',
    },
  ].obs;

  // Displayed customer list
  final filteredCustomers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    filteredCustomers.assignAll(customers);
    super.onInit();
  }

  void filterCustomers(String query) {
    if (query.isEmpty) {
      filteredCustomers.assignAll(customers);
    } else {
      final lowerQuery = query.toLowerCase();
      filteredCustomers.assignAll(
        customers.where((customer) =>
          customer['name'].toLowerCase().contains(lowerQuery) ||
          customer['phone'].toLowerCase().contains(lowerQuery)
        ),
      );
    }
  }
}
