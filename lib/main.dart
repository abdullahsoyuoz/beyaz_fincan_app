import 'package:beyaz_fincan_app/Pages/Auth/WelcomePage.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppStarter());
}

class AppStarter extends StatefulWidget {
  @override
  _AppStarterState createState() => _AppStarterState();
}

class _AppStarterState extends State<AppStarter> {
  @override
  void initState() {
    super.initState();
    FlutterStatusbarManager.setColor(appColorStatusBarColor, animated: true);
    FlutterStatusbarManager.setNavigationBarColor(
        Color.fromARGB(255, 63, 8, 113));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NeusaNextPro'),
      home: WelcomePage(),
      // home: HomePage(),
    );
  }
}
