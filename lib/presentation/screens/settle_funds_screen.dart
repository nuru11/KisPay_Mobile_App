import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/settle_funds_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class SettleFundScreen extends StatelessWidget {
  final controller = Get.put(SettleFundController());

  SettleFundScreen({super.key});

  void showSettleModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Settle Funds", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount to Settle"),
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.settleNow,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                backgroundColor: mainColor,
              ),
              child: const Text("Confirm", style: TextStyle(color: Colors.white)),
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
      // appBar: AppBar(title: const Text("Settle Funds")),
      appBar: const CustomAppBar(title: 'Settle Funds'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Available Balance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text("${controller.availableBalance.value.toStringAsFixed(2)} ETB",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainColor)),
                  ],
                ),
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Recent Settlements", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.settlements.length,
                  itemBuilder: (_, index) {
                    final item = controller.settlements[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on_outlined, color: Colors.green),
                        title: Text("${item['amount']} ETB"),
                        subtitle: Text(item['description']),
                        trailing: Text(item['date'], style: const TextStyle(fontSize: 12)),
                      ),
                    );
                  },
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSettleModal(context),
        backgroundColor: mainColor,
        icon: const Icon(Icons.swap_horiz, color: Colors.white),
        label: const Text("Settle Now", style: TextStyle(color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
