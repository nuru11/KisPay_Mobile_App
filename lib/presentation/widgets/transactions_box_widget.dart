import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/transaction_controller.dart';

class RecentTransactionBox extends StatefulWidget {
  const RecentTransactionBox({super.key});

  @override
  State<RecentTransactionBox> createState() => _RecentTransactionBoxState();
}

class _RecentTransactionBoxState extends State<RecentTransactionBox> {
  final controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final transactions = controller.allTransactions.take(3).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/transactions_list');
                },
                child: Text(
                  "View All",
                  style: TextStyle(color: mainColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // List of recent 3 transactions
          ...transactions.map((tx) {
            return Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: tx['isDebit']
                          ? Colors.red[100]
                          : Colors.green[100],
                      child: Icon(
                        tx['isDebit']
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: tx['isDebit'] ? Colors.red : Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.formatDate(tx['date']),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      tx['amount'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:
                            tx['isDebit'] ? Colors.redAccent : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      );
    });
  }
}
