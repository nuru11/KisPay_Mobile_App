import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/qr_payment_controller.dart';

class QRPaymentScreen extends StatelessWidget {
  final QRPaymentController controller = Get.put(QRPaymentController());

  QRPaymentScreen({super.key});

  void showQRInputModal(BuildContext context) {
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
            const Text("Generate QR Payment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: "Customer Name"),
            ),
            TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(labelText: "Description (optional)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.generateQR,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                backgroundColor: mainColor,
              ),
              child: const Text("Generate QR", style: TextStyle(color: Colors.white)),
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
      appBar: AppBar(
        title: const Text("QR Payment"),
      ),
      body: Obx(() => Center(
            child: controller.qrData.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("No QR Generated Yet"),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () => showQRInputModal(context),
                        icon: const Icon(Icons.qr_code, color: Colors.white,),
                        label: const Text("Generate QR", style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImageView(
                        data: controller.qrData.value,
                        version: QrVersions.auto,
                        size: 250.0,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () => showQRInputModal(context),
                        icon: const Icon(Icons.refresh, color: Colors.white),
                        label: const Text("Regenerate", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
