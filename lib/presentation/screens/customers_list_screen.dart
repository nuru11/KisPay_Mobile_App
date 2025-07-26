import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/customer_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class CustomersListScreen extends StatelessWidget {
  CustomersListScreen({super.key});

  final CustomerController controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: mainColor,
      //   foregroundColor: Colors.black87,
      //   title: const Text('Customers', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      //   centerTitle: true,
      // ),

      appBar: const CustomAppBar(title: 'Customers'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Field
            TextField(
              onChanged: controller.filterCustomers,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search customers...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Customer List (reactive)
            Expanded(
              child: Obx(() {
                if (controller.filteredCustomers.isEmpty) {
                  return const Center(child: Text("No customers found"));
                }

                return ListView.builder(
                  itemCount: controller.filteredCustomers.length,
                  itemBuilder: (context, index) {
                    final customer = controller.filteredCustomers[index];
                    return _buildCustomerCard(customer, context);
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerCard(Map<String, dynamic> customer, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person,),
        ),
        title: Text(customer['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(customer['phone'], style: const TextStyle(color: Colors.grey)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Spent', style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text(customer['totalSpent'], style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onTap: () {
          // TODO: Navigate to detail page
        },
      ),
    );
  }
}
