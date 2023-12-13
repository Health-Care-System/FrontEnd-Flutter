import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/bottom_bar/inherited_data_provider.dart';
import 'package:capstone_project/screens/account/contact_us/contact_us_screen.dart';
import 'package:capstone_project/screens/account/privacy_policy/privacy_policy_screen.dart';
import 'package:capstone_project/screens/account/profile/profile_screen.dart';
import 'package:capstone_project/screens/account/widgets/menu_tile_widget.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: AccountScreen(),
//     ),
//   );
// }

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().primaryFrame,
        foregroundColor: Colors.white,
        title: Text(
          'Akun',
          style: ThemeTextStyle().titleMedium,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 1 / 3,
              height: MediaQuery.of(context).size.height * 1 / 7,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_pic.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Mulawarman Suhendra',
              style: ThemeTextStyle().titleMedium,
            ),
            const SizedBox(height: 16),
            MenuTileWidget(
              icon: SvgPicture.asset(
                  'assets/icons/account_screen/people_icon.svg'),
              title: 'Profil Kamu',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            MenuTileWidget(
              icon: SvgPicture.asset(
                  'assets/icons/account_screen/hubungi_kami_icon.svg'),
              title: 'Hubungi Kami',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUsScreen(),
                  ),
                );
              },
            ),
            MenuTileWidget(
              icon: SvgPicture.asset(
                  'assets/icons/account_screen/privacy_policy_icon.svg'),
              title: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen(),
                  ),
                );
              },
            ),
            MenuTileWidget(
              onTap: () {SharedPreferencesUtils.clear();
              },
              icon: SvgPicture.asset(
                  'assets/icons/account_screen/logout_icon.svg'),
              title: 'Keluar',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 4),
    );
  }
}
