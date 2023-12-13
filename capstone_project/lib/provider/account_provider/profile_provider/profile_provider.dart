import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/api/profile_api.dart';
import 'package:capstone_project/models/profile_model.dart';
import 'package:capstone_project/screens/account/profile/widgets/bottomsheet_tile.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';

class ProfileProvider extends ChangeNotifier {
  String? _tbValue;
  get tbValue => _tbValue;
  String? _bbValue;
  get bbValue => _bbValue;

  String? _fullNameValue;
  get fullNameValue => _fullNameValue;
  String? _emailValue;
  get emailValue => _emailValue;
  String? _passwordValue;
  get passwordValue => _passwordValue;
  String? _phoneValue;
  get phoneValue => _phoneValue;
  String? _birthdateValue;
  get birthdateValue => _birthdateValue;
  String? _gender;
  get gender => _gender;
  String? _bloodType;
  get bloodType => _bloodType;

  final TextEditingController _tbController = TextEditingController();
  TextEditingController get tbController => _tbController;
  final TextEditingController _bbController = TextEditingController();
  TextEditingController get bbController => _bbController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  final TextEditingController _datePickerController = TextEditingController();
  TextEditingController get datePickerController => _datePickerController;
  final GroupButtonController _genderController = GroupButtonController();
  GroupButtonController get genderController => _genderController;
  final DropdownController _bloodTypeController = DropdownController();
  DropdownController get bloodTypeController => _bloodTypeController;

  Future<ProfileResults> getUserProfile() async {
    ProfileResults? dataResult;
    try {
      final response = await ProfileApi.getUserProfile();
      dataResult = response!;
    } catch (e) {
      debugPrint(e.toString());
    }

    return dataResult!;
  }

  void openProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.grey[200],
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 1 / 3.7,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              BottomSheetTile(
                title: 'Edit Foto Profil',
                iconLeading: SvgPicture.asset(
                  'assets/icons/account_screen/profile_screen/bottom_sheet/edit_foto_icon.svg',
                  height: 20,
                ),
                iconTrailing: Icons.close_rounded,
                onPressedTrailing: () => Navigator.pop(context),
              ),
              const SizedBox(height: 4),
              BottomSheetTile(
                title: 'Ambil Gambar',
                iconLeading: SvgPicture.asset(
                  'assets/icons/account_screen/profile_screen/bottom_sheet/ambil_foto_icon.svg',
                  height: 20,
                ),
                onPressed: () {},
                tileColor: ThemeColor().white,
              ),
              const SizedBox(height: 4),
              BottomSheetTile(
                title: 'Pilih Gambar',
                iconLeading: SvgPicture.asset(
                  'assets/icons/account_screen/profile_screen/bottom_sheet/pilih_foto_icon.svg',
                  height: 18,
                ),
                onPressed: () {},
                tileColor: ThemeColor().white,
              ),
              const SizedBox(height: 4),
              BottomSheetTile(
                title: 'Hapus Gambar',
                iconLeading: SvgPicture.asset(
                  'assets/icons/account_screen/profile_screen/bottom_sheet/hapus_foto_icon.svg',
                  height: 20,
                ),
                onPressed: () {},
                tileColor: ThemeColor().white,
              ),
            ],
          ),
        );
      },
    );
  }
}
