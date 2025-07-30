import 'package:get/get.dart';

class ReportController extends GetxController {
  var reportData = <String, dynamic>{}.obs;

  get loginStatus => null;

  @override
  void onInit() {
    super.onInit();
    // Dummy summary data
    reportData.value = {
      'totalSales': 12500.00,
      'totalRefunds': 750.00,
      'totalSettlements': 9400.00,
      'transactionFees': 300.00,
      'date': '2025-07-30',
    };
  }

  // Optional: reload, filter, or fetch data
  void refreshReport() {
    reportData.value = {
      'totalSales': 15200.00,
      'totalRefunds': 900.00,
      'totalSettlements': 10500.00,
      'transactionFees': 340.00,
      'date': '2025-07-31',
    };
  }
}
