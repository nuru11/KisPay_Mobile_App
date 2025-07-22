import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:flutter/material.dart';

class RecentTransactionBox extends StatelessWidget {
  const RecentTransactionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        "title": "Paid to Kispay",
        "date": "Jul 21, 2025 • 11:35 AM",
        "amount": "- \$40.00",
        "isDebit": true,
      },
      {
        "title": "Received from Sara",
        "date": "Jul 20, 2025 • 04:10 PM",
        "amount": "+ \$120.00",
        "isDebit": false,
      },
      {
        "title": "Top-Up from Bank",
        "date": "Jul 19, 2025 • 08:00 AM",
        "amount": "+ \$250.00",
        "isDebit": false,
      },
    ];

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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Coming soon!")),
                );
              },
              child: Text(
                "View All",
                style: TextStyle(color: mainColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // List of transactions
        Column(
          children: transactions.map((tx) {
            return Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: mainColor.withOpacity(0.1),
                      child: Icon(
                        tx['isDebit'] ? Icons.arrow_upward : Icons.arrow_downward,
                        color: mainColor,
                        size: 20,
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
                            tx['date'],
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
                        color: tx['isDebit'] ? Colors.redAccent : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}