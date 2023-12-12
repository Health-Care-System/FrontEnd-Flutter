import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/google_button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        color: ThemeColor().textChat,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 203,
              height: 82,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Logo.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masuk',
                style: ThemeTextStyle().hadlineSmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 35),
            CustomTextField(
              title: 'Username',
              hintText: 'Input username/email',
              controller: userController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'Password',
              hintText: 'Input password',
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    //ke halaman lupa password
                  },
                  child: Text(
                    'Lupa Password?',
                    style: ThemeTextStyle().titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                title: 'Login',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Atau login menggunakan',
              style: TextStyle(
                color: Color(0xff999999),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            GoogleButtonWidget(onPressed: () {
              // menuju google
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun? ',
                  style: ThemeTextStyle().titleMedium,
                ),
                GestureDetector(
                  onTap: () {
                    // kehalaman register
                  },
                  child: Text(
                    'Daftar disini',
                    style: ThemeTextStyle().titleMedium.copyWith(
                          color: ThemeColor().primaryFrame,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}