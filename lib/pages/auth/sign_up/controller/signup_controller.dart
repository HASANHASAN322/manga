import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/utils/constants/images_string.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/enum/enum.dart';

class SignUpController extends GetxController {
  final obscureText = true.obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController  emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  RxString selectedCountry = ''.obs;
  Rx<Sex> selectedSex = Sex.male.obs;
  List myImages = [
    MyImages.profile,
    MyImages.male1,
    MyImages.male2,
    MyImages.girl1,
    MyImages.girl2,
  ];

  void changSex(Sex val) {
    selectedSex.value = val;
  }

  void showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: MyColors.bgColor,
      builder: (BuildContext context) {
        return CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: MyColors.mainColor,
          searchInputDecoration: const InputDecoration(
            hintText: 'Search...',
          ),
          isSearchable: true,
          title: const Text('Select your country'),
          onValuePicked: (Country country) {
            countryController.text = country.name;
            selectedCountry.value = country.name;
          },
          itemBuilder: buildDialogItem,
        );
      },
    );
  }

  Widget buildDialogItem(Country country) {
    return ListTile(
      leading: CountryPickerUtils.getDefaultFlagImage(country),
      title: Text(country.name),
      subtitle: Text('+${country.phoneCode}'),
    );
  }
}
