import 'package:flutter/material.dart';
import 'package:kispay_merchant/config/assets.dart';

// ignore: use_key_in_widget_constructors
class BanksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bankList = [
    {
      'bankName': "Commercial Bank of Ethiopia",
      'img': Image.asset(AppAssets.cbe, fit: BoxFit.cover),
    },
    {
      'bankName': "Dashen Bank",
      'img': Image.asset(AppAssets.dashen, fit: BoxFit.cover),
    },
    {
      'bankName': "Wegagen Bank",
      'img': Image.asset(AppAssets.wegagen, fit: BoxFit.cover),
    },
    {
      'bankName': "Amhara Bank",
      'img': Image.asset(AppAssets.amhara, fit: BoxFit.cover),
    },
    {
      'bankName': "Awash Bank",
      'img': Image.asset(AppAssets.awash, fit: BoxFit.cover),
    },
    {
      'bankName': "Nib International Bank",
      'img': Image.asset(AppAssets.nib, fit: BoxFit.cover),
    },
    {
      'bankName': "Bank of Abyssinia",
      'img': Image.asset(AppAssets.abyssinia, fit: BoxFit.cover),
    },
    {
      'bankName': "Zemen Bank",
      'img': Image.asset(AppAssets.zemen, fit: BoxFit.cover),
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Banks")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coming Soon",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showBankListSheet(context);
              },
              child: Text("View Banks"),
            ),
          ],
        ),
      ),
    );
  }

  void _showBankListSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Banks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: bankList.length,
                  itemBuilder: (context, index) {
                    final bank = bankList[index];
                    return ListTile(
                      leading: SizedBox(width: 40, height: 40, child: bank['img']),
                      title: Text(bank['bankName']),
                      onTap: () {
                        Navigator.pop(context); // Close bottom sheet
                        _showAccountInputDialog(context, bank['bankName'], bank['img']);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAccountInputDialog(BuildContext context, String bankName, Widget bankImage) {
    final TextEditingController accountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Row(
            children: [
              SizedBox(width: 40, height: 40, child: bankImage),
              const SizedBox(width: 10),
              Expanded(child: Text(bankName, style: TextStyle(fontSize: 18))),
            ],
          ),
          content: TextField(
            controller: accountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Account Number',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String accountNumber = accountController.text.trim();
                Navigator.pop(context); // Close dialog
                // Optionally: handle account number here
                print('Selected $bankName with Account Number: $accountNumber');
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }
}
