
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class BanksScreen extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Coming Soon", style: TextStyle(color: Colors.black, fontSize: 24))],),
          ],
        ),
      )
    );
  }

   }

  