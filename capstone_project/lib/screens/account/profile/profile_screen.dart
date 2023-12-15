import 'dart:io';

import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/api/profile_api.dart';
import 'package:capstone_project/models/profile_model.dart';
import 'package:capstone_project/provider/account_provider/profile_provider/profile_provider.dart';
import 'package:capstone_project/screens/account/profile/new_pass_screen/new_pass_screen.dart';
import 'package:capstone_project/screens/account/profile/widgets/profile_tile_widget.dart';
import 'package:capstone_project/screens/account/profile/widgets/text_field_profile.dart';
import 'package:capstone_project/screens/account/profile/widgets/text_field_tb_bb.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final datePickerController = TextEditingController();

  DateTime currentDate = DateTime.now();

  final List<CoolDropdownItem<String>> _jenisKelaminDropdownItem = [
    CoolDropdownItem(label: 'Laki - Laki', value: 'male'),
    CoolDropdownItem(label: 'Perempuan', value: 'female'),
  ];

  final List<CoolDropdownItem<String>> _golonganDarahDropdownItem = [
    CoolDropdownItem(label: 'O-', value: 'O-'),
    CoolDropdownItem(label: 'O+', value: 'O+'),
    CoolDropdownItem(label: 'A-', value: 'A-'),
    CoolDropdownItem(label: 'A+', value: 'A+'),
    CoolDropdownItem(label: 'B-', value: 'B-'),
    CoolDropdownItem(label: 'B+', value: 'B+'),
    CoolDropdownItem(label: 'AB-', value: 'AB-'),
    CoolDropdownItem(label: 'AB+', value: 'AB+'),
  ];

  final _golonganDarahController = DropdownController();

  final _jenisKelaminController = DropdownController();

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    profileProvider.getUserDatas();
    // profileProvider.getProfilePicture();
    // profileProvider.getEmail();
    // profileProvider.getFullName();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor().primaryFrame,
          foregroundColor: Colors.white,
          title: Text(
            'Profil',
            style: ThemeTextStyle().titleMedium,
          ),
          centerTitle: true,
          leading: BackButton(
            onPressed: () async {
              final data = await ProfileApi.getUserProfile();
              debugPrint(data.toString());
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      profileProvider.openProfileBottomSheet(context);
                    },
                    child: profileProvider.profilePicture == null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 1 / 3,
                            height: MediaQuery.of(context).size.height * 1 / 7,
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1 / 3,
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      7,
                                  decoration: BoxDecoration(
                                    color: ThemeColor().profileCircle,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/account_screen/profile_screen/bottom_sheet/edit_foto_icon.svg'),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 1 / 3,
                            height: MediaQuery.of(context).size.height * 1 / 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(
                                  File(profileProvider.profilePicture),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Edit',
                    style: ThemeTextStyle().titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    profileProvider.fullNameValue,
                    style: ThemeTextStyle().titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldTbBb(
                        title: 'TB',
                        hintText: 'Tinggi Badan',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(width: 12),
                      TextFieldTbBb(
                        title: 'BB',
                        hintText: 'Berat Badan',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ProfileTileWidget(
                    title: 'Email',
                    icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/mail_icon.svg'),
                    content: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        profileProvider.emailValue,
                        style: ThemeTextStyle().bodySmall,
                      ),
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Password',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/password_icon.svg',
                    ),
                    content: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '*******',
                            style: ThemeTextStyle().bodySmall,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewPassScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.navigate_next,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Nomor Ponsel',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/phone_icon.svg',
                    ),
                    content: const SizedBox(
                      height: 32,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextFieldProfile(
                          hintText: '08xxxxxxxx',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Tanggal Lahir',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/calendar_icon.svg',
                    ),
                    content: TextfieldDatePicker(
                      onFieldSubmitted: (date) {},
                      style: ThemeTextStyle().bodySmall,
                      textfieldDatePickerController: datePickerController,
                      materialDatePickerFirstDate: DateTime(1970),
                      materialDatePickerLastDate: DateTime(2024),
                      materialDatePickerInitialDate: currentDate,
                      preferredDateFormat: DateFormat('dd-MM-yyyy'),
                      cupertinoDatePickerMaximumDate: DateTime(2024),
                      cupertinoDatePickerMinimumDate: DateTime(1970),
                      cupertinoDatePickerBackgroundColor: Colors.white,
                      cupertinoDatePickerMaximumYear: 2023,
                      cupertinoDateInitialDateTime: currentDate,
                      cursorColor: ThemeColor().primaryFrame,
                      decoration: InputDecoration(
                        hintText: 'dd-MM-yyyy',
                        hintStyle: ThemeTextStyle().bodySmall.copyWith(
                              color: ThemeColor().placeHolder,
                            ),
                        suffixIcon: const Icon(
                          Icons.calendar_month_rounded,
                          size: 20,
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        filled: true,
                        fillColor: ThemeColor().textField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: ThemeColor().primaryButtonActive,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Jenis Kelamin',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/gender_icon.svg',
                    ),
                    content: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: CoolDropdown(
                        dropdownList: _jenisKelaminDropdownItem,
                        controller: _jenisKelaminController,
                        onChange: (value) {
                          debugPrint(value);
                        },
                        onOpen: (value) {},
                        resultOptions: ResultOptions(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          textStyle: ThemeTextStyle().bodySmall,
                          placeholder: 'L/P',
                          placeholderTextStyle:
                              ThemeTextStyle().bodySmall.copyWith(
                                    color: ThemeColor().placeHolder,
                                  ),
                          render: ResultRender.all,
                          boxDecoration: BoxDecoration(
                            color: ThemeColor().textField,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          openBoxDecoration: BoxDecoration(
                            color: ThemeColor().white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: ThemeColor().primaryButtonActive,
                              width: 2,
                            ),
                          ),
                        ),
                        dropdownItemOptions: DropdownItemOptions(
                          textStyle: ThemeTextStyle().bodySmall,
                          height: 30,
                          render: DropdownItemRender.all,
                          selectedPadding: EdgeInsets.zero,
                          mainAxisAlignment: MainAxisAlignment.center,
                          selectedBoxDecoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: ThemeColor()
                                    .primaryButtonActive
                                    .withOpacity(0.7),
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Golongan Darah',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/blood_icon.svg',
                    ),
                    content: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: CoolDropdown(
                        dropdownList: _golonganDarahDropdownItem,
                        controller: _golonganDarahController,
                        onChange: (value) {
                          debugPrint(value);
                        },
                        onOpen: (value) {},
                        resultOptions: ResultOptions(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          textStyle: ThemeTextStyle().bodySmall,
                          placeholder: 'O/A/B/AB',
                          placeholderTextStyle:
                              ThemeTextStyle().bodySmall.copyWith(
                                    color: ThemeColor().placeHolder,
                                  ),
                          render: ResultRender.all,
                          boxDecoration: BoxDecoration(
                            color: ThemeColor().textField,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          openBoxDecoration: BoxDecoration(
                            color: ThemeColor().white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: ThemeColor().primaryButtonActive,
                              width: 2,
                            ),
                          ),
                        ),
                        dropdownItemOptions: DropdownItemOptions(
                          textStyle: ThemeTextStyle().bodySmall,
                          height: 30,
                          render: DropdownItemRender.all,
                          selectedPadding: EdgeInsets.zero,
                          mainAxisAlignment: MainAxisAlignment.center,
                          selectedBoxDecoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: ThemeColor()
                                    .primaryButtonActive
                                    .withOpacity(0.7),
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
