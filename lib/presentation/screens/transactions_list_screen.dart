// lib/presentation/screens/transactions_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/transaction_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionController());

    return Scaffold(
      appBar: const CustomAppBar(title: 'Transactions'),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // Dropdown for filter
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  value: controller.selectedFilter.value,
                  isExpanded: true,
                  items: ['All', 'Week', 'Month', 'Quarter' ]
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.changeFilter(value);
                    }
                  },
                ),
              )),

          const SizedBox(height: 10),

          // Transactions List
          Expanded(
            child: Obx(() => ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.filteredTransactions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final tx = controller.filteredTransactions[index];
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
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
                              color: tx['isDebit']
                                  ? Colors.red
                                  : Colors.green,
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  controller.formatDate(tx['date']),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            tx['amount'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: tx['isDebit']
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
