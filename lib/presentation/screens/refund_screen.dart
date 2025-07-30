import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/refund_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class RefundScreen extends StatelessWidget {
  final RefundController controller = Get.put(RefundController());

  RefundScreen({super.key});

  void showRefundModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Issue Refund",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: controller.transactionIdController,
              decoration:
                  const InputDecoration(labelText: "Transaction ID"),
            ),
            TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            TextField(
              controller: controller.reasonController,
              decoration: const InputDecoration(labelText: "Reason"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.submitRefund,
              child: const Text("Submit Refund",
                  style: TextStyle(color: Colors.white)),
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
      
      appBar: const CustomAppBar(title: 'Refunds'),
      body: Obx(() {
        if (controller.refunds.isEmpty) {
          return const Center(child: Text("No refunds issued yet."));
        }

        return ListView.builder(
          itemCount: controller.refunds.length,
          itemBuilder: (_, index) {
            final refund = controller.refunds[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.refresh_outlined,
                    color: Colors.orange),
                title: Text("${refund['amount']} ETB"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TXN: ${refund['transactionId']}"),
                    Text("Reason: ${refund['reason']}"),
                  ],
                ),
                trailing: Text(refund['date'] ?? '',
                    style: const TextStyle(fontSize: 12)),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showRefundModal(context),
        backgroundColor: mainColor,
        icon: const Icon(Icons.refresh, color: Colors.white),
        label: const Text("Refund Now", style: TextStyle(color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
