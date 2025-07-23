import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SwiperBuilder extends StatefulWidget {
  const SwiperBuilder({super.key});

  @override
  _SwiperBuilderState createState() => _SwiperBuilderState();
}

class _SwiperBuilderState extends State<SwiperBuilder> {
  final List<bool> showFullCardNumber = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: SizedBox(
                height: 225,
                child: Swiper(
                  itemWidth: MediaQuery.of(context).size.width * 0.85,
                  itemHeight: 200,
                  loop: true,
                  duration: 1200,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildBalanceCard(index);
                  },
                  itemCount: 4,
                  layout: SwiperLayout.STACK,
                  viewportFraction: 0.9,
                  scale: 0.95,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(int index) {
    final cardColors = [
      [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)], 
      [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)], 
      [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)], 
      [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)], 
    ];

    final fullCardNumbers = [
      {'balance': '1234 5678 9012 3456', 'cardName': "Settle"},
      {'balance': '9999 8888 7777 6666', 'cardName': "Withdraw"},
      {'balance': '1111 2222 3333 4444', 'cardName': "Transfer"},
      {'balance': '4321 8765 2109 6543', 'cardName': "Unsettle"},
    ];

    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: cardColors[index % cardColors.length],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fullCardNumbers[index]['cardName'] ?? 'Card Name',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: Icon(
                  showFullCardNumber[index]
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    showFullCardNumber[index] = !showFullCardNumber[index];
                  });
                },
              ),
            ],
          ),
          const Spacer(),
          Text(
  showFullCardNumber[index]
      ? fullCardNumbers[index]['balance'] ?? '**** **** **** ****' 
      : '**** **** **** ${fullCardNumbers[index]['balance']?.substring(fullCardNumbers[index]['balance']!.length - 4) ?? '****'}',
  style: const TextStyle(
    fontSize: 20,
    letterSpacing: 2,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  ),
),
          const SizedBox(height: 10),
          const Text(
            'Balance',
            style: TextStyle(color: Colors.black54),
          ),
          Text(
            '\$${(index + 1) * 1234.56}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}