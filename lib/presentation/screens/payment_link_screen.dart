import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/payment_link_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class PaymentLinksScreen extends StatelessWidget {
  final PaymentLinkController controller = Get.put(PaymentLinkController());

  PaymentLinksScreen({super.key});

  void showCreateLinkModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Create Payment Link", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.createLink,
              child: Text("Create Link", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                backgroundColor: mainColor,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment Links'),
      body: Obx(() {
        if (controller.links.isEmpty) {
          return const Center(child: Text("No payment links yet."));
        }

        return ListView.builder(
          itemCount: controller.links.length,
          itemBuilder: (context, index) {
            final link = controller.links[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: ListTile(
                title: Text(link['name'] ?? ""),
                subtitle: Text(link['description'] ?? ""),
                trailing: Text("${link['amount']} ETB", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCreateLinkModal(context),
        backgroundColor: mainColor,
        label: const Text("Create Link", style: TextStyle(color: Colors.white),),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
