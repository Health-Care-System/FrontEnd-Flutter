import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/provider/account_screen/contact_us_screen/contact_us_provider.dart';
import 'package:capstone_project/provider/article_provider/article_list_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_list_provider.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
<<<<<<< HEAD
import 'package:capstone_project/provider/regiter_provider/otp_provider.dart';
import 'package:capstone_project/provider/regiter_provider/register_provider.dart';
import 'package:capstone_project/screens/account/account_screen.dart';
import 'package:capstone_project/screens/account/profile/profile_screen.dart';
import 'package:capstone_project/screens/bottom_bar/bottom_bar_screen.dart';
=======
import 'package:capstone_project/provider/otp_provider.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
>>>>>>> 7017c5fbba24094b5eeea2e106988f5306e2df25
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/register/register_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
<<<<<<< HEAD
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MedicineProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OTPProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactUsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
=======
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MedicineProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
      ),
      ChangeNotifierProvider(
          create: (context) => OtpProvider(
              Provider.of<RegisterProvider>(context, listen: false))),
      ChangeNotifierProvider(
        create: (context) => ContactUsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DoctorsListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArticlesListProvider(),
      )
    ],
    child: const MyApp(),
  ));
>>>>>>> 7017c5fbba24094b5eeea2e106988f5306e2df25
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine App',
      theme: ThemeData(
        fontFamily: 'FontRoboto',
<<<<<<< HEAD
        useMaterial3: true,
      ),
      home: BottomBarScreen(),
=======
        colorSchemeSeed: ThemeColor().primaryFrame,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
>>>>>>> 7017c5fbba24094b5eeea2e106988f5306e2df25
    );
  }
}
