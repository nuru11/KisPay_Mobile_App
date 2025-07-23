import 'package:flutter/material.dart';
import 'package:kispay_merchant/core/constant/colors.dart';

class QuickAccessGridWidget extends StatelessWidget {
  const QuickAccessGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildQuickAccessGrid();
  }

  Widget _buildQuickAccessGrid() {
  final items = [
  ['Create Payment Link', Icons.link],
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
      return Container(
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
      );
    },
  );
}

}