import 'dart:convert';
import 'dart:io';

import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/models/api/profile_api.dart';
import 'package:capstone_project/models/profile_model.dart';
import 'package:capstone_project/screens/account/profile/widgets/bottomsheet_tile.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  String? _tbValue;
  get tbValue => _tbValue ?? "";
  String? _bbValue;
  get bbValue => _bbValue ?? "";

  File? _profilePicture;
  get profilePicture => _profilePicture;
  String? _fullNameValue;
  get fullNameValue => _fullNameValue ?? "";
  String? _emailValue;
  get emailValue => _emailValue ?? "";
  String? _passwordValue;
  get passwordValue => _passwordValue ?? "";
  String? _phoneValue;
  get phoneValue => _phoneValue ?? "";
  String? _birthdateValue;
  get birthdateValue => _birthdateValue ?? "";
  DateTime? _initialDate;
  get initialDate => _initialDate ?? "";
  String? _gender;
  get gender => _gender ?? "";
  String? _bloodType;
  get bloodType => _bloodType ?? "";

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

  Future<ProfileResults> getUserDatas() async {
    ProfileResults? response;
    try {
      response = await ProfileApi.getUserProfile();
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint(response?.toString());
    getProfilePicture();
    getFullName();
    getEmail();
    return response!;
  }

  Future<ProfileResults> updateUserDatas()async{
    ProfileResults? response;
    final token = SharedPreferencesUtils.getToken();

    try {
      final updateData = {
        'fullname' : _fullNameValue,
        'email': _emailValue,
        'phone' : _phoneValue,
        'birthdate' : _birthdateValue,
        'gender' : _gender,
        'bloodType' : _bloodType,
        'height' : _tbValue,
        'weight' : _bbValue,
      };
      final jsonData = jsonEncode(updateData);

      final dioResponse = await Dio().put(
         '${Urls.baseUrl}${Urls.profile}',
         data: jsonData,
         options: Options(
          headers: {
             "Authorization": "Bearer $token",
          },
         ),
      );
      if (dioResponse.statusCode == 201) {
        debugPrint('Profile update successfully');
        response = ProfileResults.fromJson(dioResponse.data);
        
      }else{
        debugPrint('Error updating profile: ${dioResponse.statusCode}');
      }
      
    } catch (e) {
      debugPrint('Dio Error : $e');
    }
    return response!;
  }


  void updateUserProfile() async{
    final userData = await updateUserDatas();
    
    // Update fields
    _profilePicture = File(userData.profilePicture);
    _bbValue = userData.weight.toString();
    _tbValue = userData.height.toString();
    _birthdateValue = userData.birthdate;
    _gender = userData.gender;
    _bloodType = userData.bloodType;
    notifyListeners();
  }

  void getProfilePicture() async {
    final userData = await getUserDatas();
    _profilePicture = File(userData.profilePicture);

    notifyListeners();
  }

  void getFullName() async {
    final userData = await getUserDatas();
    _fullNameValue = userData.fullname;
  }

  void getEmail() async {
    final userData = await getUserDatas();
    _emailValue = userData.email;
  }

  // void getPassword() async {
  //   final userData = await getUserDatas();
  //   _passwordValue = userData.
  // }

  void takePhoto() async {
    final takenPhoto =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (takenPhoto != null) {
      _profilePicture = File(takenPhoto.path);
    }
    notifyListeners();
  }

  void choosePhoto() async {
    final chosenPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (chosenPhoto != null) {
      _profilePicture = File(chosenPhoto.path);
    }
    notifyListeners();
  }

  void removePhoto() async {
    _profilePicture = null;
    notifyListeners();
  }

  void openProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: ThemeColor().profileCircle,
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
                onPressed: () {
                  takePhoto();
                },
                tileColor: ThemeColor().white,
              ),
              const SizedBox(height: 4),
              BottomSheetTile(
                title: 'Pilih Gambar',
                iconLeading: SvgPicture.asset(
                  'assets/icons/account_screen/profile_screen/bottom_sheet/pilih_foto_icon.svg',
                  height: 18,
                ),
                onPressed: () {
                  choosePhoto();
                },
                tileColor: ThemeColor().white,
              ),
              const SizedBox(height: 4),
              BottomSheetTile(
                title: 'Hapus Gambar',
                iconLeading: SvgPicture.asset(
                  'assets/icons/account_screen/profile_screen/bottom_sheet/hapus_foto_icon.svg',
                  height: 20,
                ),
                onPressed: () {
                  removePhoto();
                },
                tileColor: ThemeColor().white,
              ),
            ],
          ),
        );
      },
    );
  }
}
