import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:get/get.dart';

class QuickAccessGridWidget extends StatelessWidget {
  const QuickAccessGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildQuickAccessGrid();
  }

  Widget _buildQuickAccessGrid() {
    final items = [
      ['Payment Link', Icons.link],
      ['Transactions', Icons.receipt_long],
      ['Settle Funds', Icons.account_balance_wallet],
      ['Refunds', Icons.undo],
      ['QR Payments', Icons.qr_code_2],
      ['Customer List', Icons.people],
      ['Reports', Icons.insert_chart],
      ['Settings', Icons.settings],
    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (items[index][0] == 'Payment Link') {
              // Get.snackbar('Info', "Creating Payment Link, Comming Soon");
              Get.toNamed("/payment_links");
            } else if (items[index][0] == 'Transactions') {
              Get.toNamed('/transactions_list'); // Navigate to Transactions List screen
              // Navigate to Transactions screen
              // Navigate to Transactions screen
            } else if (items[index][0] == 'Settle Funds') {
              // Get.snackbar('Info', "Settling Funds, Comming Soon");
              Get.toNamed('/settle_funds');
              // Navigate to Settle Funds screen
            } else if (items[index][0] == 'Refunds') {
              // Get.snackbar('Info', "Processing Refunds, Comming Soon"); 
              Get.toNamed('/refund');
              // Navigate to Refunds screen
            } else if (items[index][0] == 'QR Payments') {
              // Get.snackbar('Info', "QR Payments, Comming Soon");
              Get.toNamed('/qr_payment');
              // Navigate to QR Payments screen
            } else if (items[index][0] == 'Customer List') {
              Get.toNamed('/customers_list'); // Navigate to Customer List screen
              // Navigate to Customer List screen
            } else if (items[index][0] == 'Reports') {
              // Get.snackbar('Info', "Generating Reports, Comming Soon");
              Get.toNamed('/report');
              // Navigate to Reports screen
            } else if (items[index][0] == 'Settings') {
              // Get.snackbar('Info', "Settings, Comming Soon");
              Get.toNamed('/setting');
              // Navigate to Settings screen
            }
          },
          child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            items[index][1] as IconData,
            color: mainColor,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            items[index][0] as String,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    ),
  );
},
    );
  }


}