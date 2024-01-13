import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntlPhoneField(
        // autovalidateMode: AutovalidateMode.disabled,
        decoration: const InputDecoration(labelText: 'Phone'),
        dropdownDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        flagsButtonMargin: const EdgeInsets.only(right: 8),
        flagsButtonPadding: const EdgeInsets.only(left: 8),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        // invalidNumberMessage: LocaleKeys.phone_invalid.tr(),
        // languageCode: context.locale.languageCode,
        showDropdownIcon: false,
        pickerDialogStyle: PickerDialogStyle(
          listTileDivider: const Divider(height: 1),
          // searchFieldInputDecoration: InputDecoration(
          //   labelText: LocaleKeys.search.tr(),
          // ),
        ),
      ),
    );
  }
}
