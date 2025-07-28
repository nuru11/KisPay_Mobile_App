import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:kispay_merchant/config/assets.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return _homeScreenBanner();
  }


  Widget _homeScreenBanner() {
    return Padding(
  padding: const EdgeInsets.all(1.0),

      child: ImageSlideshow(
        width: double.infinity,
         indicatorBackgroundColor: Colors.transparent,
        indicatorRadius: 4,
        isLoop: true,
        autoPlayInterval: 3000,
         indicatorColor: Colors.transparent,
        children: [
     

      Container(
          margin: const EdgeInsets.all(5),
          height: 150,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppAssets.banner1,
              fit: BoxFit.cover,
            ),
          ),
        ),

      Container(
          margin: const EdgeInsets.all(5),
          height: 150,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppAssets.banner1,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.all(5),
          height: 150,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppAssets.banner2,
              fit: BoxFit.cover,
            ),
          ),
        ),


        Container(
          margin: const EdgeInsets.all(5),
          height: 150,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppAssets.banner3,
              fit: BoxFit.cover,
            ),
          ),
        ),

     

  
      
        ],
      ),
    
   
  
);
  }
 

 
}