import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/screens/banks.dart';
import 'package:kispay_merchant/presentation/screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class CurveBar extends StatefulWidget {
  const CurveBar({super.key});

  @override
  State<CurveBar> createState() => _CurveBarState();
}

class _CurveBarState extends State<CurveBar> {
  int index = 2;
  

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    final screen = [
      BanksScreen(),
      BanksScreen(),
      HomeScreen(),
      BanksScreen(),
      BanksScreen(),
    ];

    final items = [
      const Icon(Icons.search, size: 30),
      const Icon(Icons.shopping_bag, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.receipt, size: 30),
      const Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      backgroundColor: mainColor,
      extendBody: true,
      body: screen[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        child: CurvedNavigationBar(
          color: mainColor,
          buttonBackgroundColor: mainColor,
          backgroundColor: Colors.transparent,
          items: items,
          height: 60,
          index: index,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}

