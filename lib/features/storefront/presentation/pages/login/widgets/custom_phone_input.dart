import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../widgets/easy_layout_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CustomPhoneInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final void Function(PhoneNumber)? onChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  const CustomPhoneInput(
      {required this.controller,
      required this.onChanged,
      required this.formKey,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLayoutBuilder(
        mobileWidget: _mobile(context), desktopWidget: _desktop(context));
  }

  Widget _mobile(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: 'JO',
      textAlign: TextAlign.start,
      invalidNumberMessage: "الرقم غير صحيح",
      cursorHeight: 30.0,
      style: TextStyle(color: Colors.black87, fontSize: 20.0),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged!(value);
      },
      onSaved: (newValue) {
        newValue != null ? onChanged!(newValue) : null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dropdownTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
      pickerDialogStyle: PickerDialogStyle(
          width: MediaQuery.of(context).size.width,
          listTileDivider: Divider(
            color: StoreTheme.unselectedColor,
            thickness: 1,
          ),
          searchFieldInputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: StoreTheme.tentColor)),
            focusColor: StoreTheme.tentColor,
            hintText: "ادخل رمز الهاتف او اسم الدولة",
            filled: true,
            prefixIcon: Icon(
              Ionicons.search_outline,
              size: 14,
              color: StoreTheme.commonColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: StoreTheme.tentColor)),
          ),
          countryCodeStyle: Theme.of(context).textTheme.titleMedium),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: StoreTheme.tentColor)),
        focusColor: StoreTheme.tentColor,
        hintText: "ادخل رقم الهاتف",
        filled: true,
        prefixIcon: Icon(
          Ionicons.call_outline,
          size: 14,
          color: StoreTheme.commonColor,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: StoreTheme.tentColor)),
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return IntlPhoneField(
      cursorHeight: 30.0,
      style: TextStyle(color: Colors.black87, fontSize: 20.0),
      initialCountryCode: 'JO',
      textAlign: TextAlign.start,
      invalidNumberMessage: "الرقم غير صحيح",
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged!(value);
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dropdownTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
      pickerDialogStyle: PickerDialogStyle(
          width: MediaQuery.of(context).size.width / 4,
          listTileDivider: Divider(
            color: StoreTheme.unselectedColor,
            thickness: 1,
          ),
          searchFieldInputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: StoreTheme.tentColor)),
            focusColor: StoreTheme.tentColor,
            hintText: "ادخل رمز الهاتف او اسم الدولة",
            filled: true,
            prefixIcon: Icon(
              Ionicons.search_outline,
              size: 18,
              color: StoreTheme.commonColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: StoreTheme.tentColor)),
          ),
          countryCodeStyle: Theme.of(context).textTheme.titleMedium),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: StoreTheme.tentColor)),
        focusColor: StoreTheme.tentColor,
        hintText: "ادخل رقم الهاتف",
        filled: true,
        prefixIcon: Icon(
          Ionicons.call_outline,
          size: 18,
          color: StoreTheme.commonColor,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: StoreTheme.tentColor)),
      ),
    );
  }
}

