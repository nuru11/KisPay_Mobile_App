import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/report_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class ReportScreen extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());

  ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Reports"),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.refresh),
      //       onPressed: controller.refreshReport,
      //     )
      //   ],
      // ),
      appBar: const CustomAppBar(title: 'Reports'),
      body: Obx(() {
  final report = controller.reportData;

  if (report.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }

  return RefreshIndicator(
    onRefresh: () async {
      controller.refreshReport();
    },
    child: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Summary Report - ${report['date']}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        _buildReportCard(
          title: "Total Sales",
          value: "${report['totalSales']} ETB",
          icon: Icons.trending_up,
          color: Colors.green,
        ),
        _buildReportCard(
          title: "Total Refunds",
          value: "${report['totalRefunds']} ETB",
          icon: Icons.money_off,
          color: Colors.red,
        ),
        _buildReportCard(
          title: "Total Settlements",
          value: "${report['totalSettlements']} ETB",
          icon: Icons.swap_horiz,
          color: Colors.blue,
        ),
        _buildReportCard(
          title: "Transaction Fees",
          value: "${report['transactionFees']} ETB",
          icon: Icons.receipt_long,
          color: Colors.orange,
        ),

        const SizedBox(height: 32),
        Center(
          child: ElevatedButton.icon(
            onPressed: controller.refreshReport,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text("Reload Report", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        )
      ],
    ),
  );
}),

    );
  }

  Widget _buildReportCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }
}
