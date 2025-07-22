// import 'package:kispay_merchant/core/constant/colors.dart';
// import 'package:kispay_merchant/presentation/widgets/swiper_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

//   List<bool> showFullCardNumber = [false, false, false, false];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(context),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _buildQuickAccessGrid(),
//                       const SizedBox(height: 20),
//                       _buildBanner(),
//                       const SizedBox(height: 20),
//                       // _buildBottomMenu(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: const Text(
//             'Kispay',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           subtitle: const Text(
//             'Nuru!',
//             style: TextStyle(color: Colors.white70),
//           ),
//           trailing: const Text(
//             'EN',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         Container(
//           // margin: const EdgeInsets.symmetric(horizontal: 16),
//           // padding: const EdgeInsets.all(1),
//           decoration: BoxDecoration(
//             color: mainColor,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(0.1),
//                 child: SwiperBuilder()
//                 ),
//             ],
//           ),
//         ),
       
//       ],
//     );
//   }

 


//   Widget _buildQuickAccessGrid() {
//   final items = [
//     ['Linked Bank Acct', Icons.lock],
//     ['Send Money', Icons.send],
//     ['To kispay Acct', Icons.account_balance],
//     ['Air Time', Icons.phone_android],
//     ['Cash Out', Icons.money],
//     ['Airtime Package', Icons.card_giftcard],
//     ['Scheduled Pay', Icons.schedule],
//     ['MagicPay', Icons.qr_code],
//   ];

//   return GridView.builder(
//     itemCount: items.length,
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     padding: const EdgeInsets.all(0),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 4,
//       mainAxisSpacing: 12,
//       crossAxisSpacing: 12,
//       childAspectRatio: 0.9,
//     ),
//     itemBuilder: (context, index) {
//       return Container(
//         decoration: BoxDecoration(
//           color: secondaryColorDeepBlue,
//           borderRadius: BorderRadius.circular(12), // Rounded corners
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 4,
//               offset: Offset(2, 2), // Shadow position
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               items[index][1] as IconData,
//               color: mainColor,
//               size: 28, // Increased icon size for better visibility
//             ),
//             const SizedBox(height: 8),
//             Text(
//               items[index][0] as String,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 12, color: Colors.white),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

//   Widget _buildBanner() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.purple.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Image.asset('assets/images/fuel_icon.png', height: 60), // Replace with your asset
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text('የእንግድ ከፍያዎችን', style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text('በአንድ ቅጽ'),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomMenu() {
//     final items = [
//       ['Other Bank', Icons.account_balance_wallet],
//       ['Other Wallet', Icons.wallet],
//       ['Quick', Icons.bolt],
//       ['Fuel Pay', Icons.local_gas_station],
//     ];

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: items.map((item) {
//         return Column(
//           children: [
//             Icon(item[1] as IconData, color: Colors.purple),
//             const SizedBox(height: 4),
//             Text(item[0] as String, style: const TextStyle(fontSize: 12)),
//           ],
//         );
//       }).toList(),
//     );
//   }

  
// }



//////////////////////////////////////////////////////


import 'package:kispay_merchant/config/assets.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/widgets/swiper_widget.dart';
import 'package:kispay_merchant/presentation/widgets/transactions_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<bool> showFullCardNumber = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,

      floatingActionButton: Padding(
  padding: const EdgeInsets.only(bottom: 50.0), // Adjust this value as needed
  child: FloatingActionButton(
    backgroundColor: mainColor,
    onPressed: () {
      launch('sms:+251966202667');
    },
    child: Icon(Icons.call, color: Colors.white),
  ),
),
    appBar: PreferredSize(
  preferredSize: const Size.fromHeight(40.0),
  child: AppBar(
    backgroundColor: mainColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    toolbarHeight: 40.0,
    title: const Text(
      'Hi, Nuru',
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      PopupMenuButton<String>(
        onSelected: (value) {
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: $value')),
          );
        },
        icon: const Icon(Icons.language, color: Colors.white),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'en',
            child: Text('English'),
          ),
          const PopupMenuItem(
            value: 'am',
            child: Text('Amharic'),
          ),
          const PopupMenuItem(
            value: 'ar',
            child: Text('Arabic'),
          ),
        ],
      ),
    ],
  ),
),

      body: Column(
        children: [
          Container(
                padding: const EdgeInsets.all(0.1),
                child: SwiperBuilder()
                ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildQuickAccessGrid(),
                    const SizedBox(height: 20),
                     SizedBox(
                      height: 150,
                      child: _home_screen_banner()),
                    const SizedBox(height: 20),
                    RecentTransactionBox(),
                    const SizedBox(height: 55),
                   
                   
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


 


  Widget _home_screen_banner() {
    return Padding(
  padding: const EdgeInsets.all(15.0),

      child: ImageSlideshow(
        width: double.infinity,
         indicatorBackgroundColor: Colors.transparent,
        indicatorRadius: 4,
        isLoop: true,
        autoPlayInterval: 3000,
         indicatorColor: Colors.transparent,
        children: [
     

      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(AppAssets.mainLogo, fit: BoxFit.cover),
      ),

       Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(AppAssets.mainLogo, fit: BoxFit.cover),
      ),

     

  
      
        ],
      ),
    
   
  
);
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
    padding: const EdgeInsets.all(0),
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


Widget _buildRecentTransactionBox() {
  final transactions = [
    {
      "title": "Payment to John Doe",
      "date": "Jul 21, 2025 - 2:30 PM",
      "amount": "- \$45.00",
      "isDebit": true,
    },
    {
      "title": "Received from Sarah",
      "date": "Jul 20, 2025 - 5:00 PM",
      "amount": "+ \$120.00",
      "isDebit": false,
    },
    {
      "title": "Sent to Kispay",
      "date": "Jul 19, 2025 - 11:15 AM",
      "amount": "- \$60.00",
      "isDebit": true,
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
            child: Text("View All", style: TextStyle(color: mainColor)),
          ),
        ],
      ),
      const SizedBox(height: 12),
      Column(
        children: List.generate(transactions.length, (index) {
          final tx = transactions[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: mainColor.withOpacity(0.1),
                    child: Icon(
                      Icons.arrow_upward,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         " tx['title']!",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "tx['date']!",
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Text(
                   " tx['amount']!",
                    style: TextStyle(
                      color:  Colors.redAccent ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ],
  );
}

  
}







//////////////////////////////////////////////////////////////////////////////////







// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

//   List<bool> showFullCardNumber = [false, false, false, false];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF82258C),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(context),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _buildQuickAccessGrid(),
//                       const SizedBox(height: 20),
//                       _buildBanner(),
//                       const SizedBox(height: 20),
//                       // _buildBottomMenu(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: const Text(
//             'CBE Birr',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           subtitle: const Text(
//             'በአንድ ሁን አል!',
//             style: TextStyle(color: Colors.white70),
//           ),
//           trailing: const Text(
//             'EN',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: const Color(0xFF6C1F74),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'የኢትዮጵያ ንግድ ባንክ',
//                 style: TextStyle(color: Colors.amber, fontSize: 16),
//               ),
//               const Text(
//                 'Commercial Bank of Ethiopia',
//                 style: TextStyle(color: Colors.amber, fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 '+2519********',
//                 style: TextStyle(color: Colors.white),
//               ),
//               const Text(
//                 'WELCOME BACK',
//                 style: TextStyle(color: Colors.white70, fontSize: 12),
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text('Balance (ETB): ******', style: TextStyle(color: Colors.white)),
//                   Text('Reward (ETB): ******', style: TextStyle(color: Colors.white)),
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: 16),

//         _buildBalanceCard(),
//       ],
//     );
//   }

//   Widget _buildBalanceCard() {
//   final cardColors = [
//     [Color(0xFF6C1F74), Color(0xFFBDBDBD)], // Silver
//     [Color(0xFFd7c1ec), Color(0xFFa076c3)], // Lavender
//     [Color(0xFFf5e1da), Color(0xFFc76b6b)], // Soft Rose
//     [Color(0xFFd1e8e2), Color(0xFF87c5b3)], // Mint
//   ];

//   final fullCardNumbers = [
//     '1234 5678 9012 3456',
//     '4321 8765 2109 6543',
//     '1111 2222 3333 4444',
//     '9999 8888 7777 6666',
//   ];

//   // List to track visibility
//   List<bool> showFullCardNumber = List.filled(4, false);

//   return SizedBox(
//     height: 200,
//     child: StatefulBuilder(
//       builder: (context, setState) {
//         return ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return Container(
//               width: MediaQuery.of(context).size.width * 0.75,
//               margin: const EdgeInsets.only(right: 16),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: cardColors[index % cardColors.length],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(18),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 6,
//                     offset: Offset(0, 4),
//                   )
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Afropay Card',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           showFullCardNumber[index]
//                               ? Icons.visibility_off_outlined
//                               : Icons.visibility_outlined,
//                           color: Colors.black54,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             showFullCardNumber[index] = !showFullCardNumber[index];
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   // Card Number
//                   Text(
//                     showFullCardNumber[index]
//                         ? fullCardNumbers[index]
//                         : '**** **** **** ${fullCardNumbers[index].substring(fullCardNumbers[index].length - 4)}',
//                     style: const TextStyle(
//                       fontSize: 20,
//                       letterSpacing: 2,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Balance',
//                     style: TextStyle(color: Colors.black54),
//                   ),
//                   Text(
//                     '\$${(index + 1) * 1234.56}',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     ),
//   );
// }


//   Widget _buildQuickAccessGrid() {
//     final items = [
//       ['Linked Bank Acct', Icons.lock],
//       ['Send Money', Icons.send],
//       ['To CBE Acct', Icons.account_balance],
//       ['Air Time', Icons.phone_android],
//       ['Cash Out', Icons.money],
//       ['Airtime Package', Icons.card_giftcard],
//       ['Scheduled Pay', Icons.schedule],
//       ['MagicPay', Icons.qr_code],
//     ];

//     return GridView.builder(
//       itemCount: items.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.all(0),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         childAspectRatio: 0.9,
//       ),
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.purple.shade100,
//               child: Icon(items[index][1] as IconData, color: Colors.purple),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               items[index][0] as String,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 12),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildBanner() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.purple.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Image.asset('assets/images/fuel_icon.png', height: 60), // Replace with your asset
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text('የእንግድ ከፍያዎችን', style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text('በአንድ ቅጽ'),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomMenu() {
//     final items = [
//       ['Other Bank', Icons.account_balance_wallet],
//       ['Other Wallet', Icons.wallet],
//       ['Quick', Icons.bolt],
//       ['Fuel Pay', Icons.local_gas_station],
//     ];

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: items.map((item) {
//         return Column(
//           children: [
//             Icon(item[1] as IconData, color: Colors.purple),
//             const SizedBox(height: 4),
//             Text(item[0] as String, style: const TextStyle(fontSize: 12)),
//           ],
//         );
//       }).toList(),
//     );
//   }

  
// }
