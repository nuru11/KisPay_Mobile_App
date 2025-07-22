import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kispay_merchant/config/routes.dart';
import 'package:kispay_merchant/presentation/bindings/auth_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Determine initial route based on first-time usage
  final String initialRoute = await _getInitialRoute();

  runApp(MyApp(initialRoute: initialRoute));
}

Future<String> _getInitialRoute() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  if (isFirstTime) {
    await prefs.setBool('isFirstTime', false);
    return AppRoutes.onboarding;
  }
  return AppRoutes.login;
}

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Delete data when app is backgrounded or closed
    if (state == AppLifecycleState.detached || state == AppLifecycleState.inactive) {
      _clearSecureStorage();
    }
  }

  Future<void> _clearSecureStorage() async {
    await _secureStorage.deleteAll();
    debugPrint("Secure storage cleared.");
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AfroPay',
      initialBinding: AuthBinding(),
      initialRoute: widget.initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}



// import 'package:afropay/main_screen.dart';
// import 'package:afropay/presentation/bindings/auth_binding.dart';
// import 'package:afropay/presentation/bindings/combined_binding.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.green,
//         primarySwatch: Colors.green,
//       ),
//       home: const MainScreen(),
//        initialBinding: CombinedBinding(),
      
//     );
//   }
// }