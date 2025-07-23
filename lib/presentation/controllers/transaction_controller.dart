// lib/controllers/transaction_controller.dart
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  var selectedFilter = 'Week'.obs;
  var allTransactions = <Map<String, dynamic>>[].obs;
  var filteredTransactions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
    applyFilter();
  }

  void _loadMockData() {
    final now = DateTime.now();
    allTransactions.value = [
      {
        'title': 'Paid to Kispay',
        'date': now.subtract(const Duration(days: 1)),
        'amount': '- \$40.00',
        'isDebit': true,
      },
      {
        'title': 'Received from Sara',
        'date': now.subtract(const Duration(days: 10)),
        'amount': '+ \$120.00',
        'isDebit': false,
      },
      {
        'title': 'Top-Up from Bank',
        'date': now.subtract(const Duration(days: 40)),
        'amount': '+ \$250.00',
        'isDebit': false,
      },
      {
        'title': 'Quarterly Bonus',
        'date': now.subtract(const Duration(days: 90)),
        'amount': '+ \$500.00',
        'isDebit': false,
      },
    ];
  }

  void applyFilter() {
    DateTime now = DateTime.now();
    DateTime cutoff;

    switch (selectedFilter.value) {
      case 'Week':
        cutoff = now.subtract(const Duration(days: 7));
        break;
      case 'Month':
        cutoff = DateTime(now.year, now.month - 1, now.day);
        break;
      case 'Quarter':
        cutoff = DateTime(now.year, now.month - 3, now.day);
        break;
      default:
        cutoff = DateTime(2000);
    }

    filteredTransactions.value = allTransactions
        .where((tx) => (tx['date'] as DateTime).isAfter(cutoff))
        .toList();
  }

  void changeFilter(String newFilter) {
    selectedFilter.value = newFilter;
    applyFilter();
  }

  String formatDate(DateTime date) => DateFormat('MMM dd, yyyy').format(date);
}
