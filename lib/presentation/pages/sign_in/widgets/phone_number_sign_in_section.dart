import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phone_number_sign_in/application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in/constants/texts.dart';

class PhoneNumberSignInSection extends StatefulWidget {
  const PhoneNumberSignInSection({Key? key}) : super(key: key);

  @override
  State<PhoneNumberSignInSection> createState() => _PhoneNumberSignInSectionState();
}

class _PhoneNumberSignInSectionState extends State<PhoneNumberSignInSection> {
  final PhoneNumber initialPhone = PhoneNumber(isoCode: "TR");

  @override
  void didChangeDependencies() {
    context.read<PhoneNumberSignInCubit>().phoneNumberChanged(phoneNumber: initialPhone.phoneNumber ?? "");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber phoneNumber) {
          context.read<PhoneNumberSignInCubit>().phoneNumberChanged(phoneNumber: phoneNumber.phoneNumber!);
        },
        onInputValidated: (bool isPhoneNumberInputValidated) {
          context.read<PhoneNumberSignInCubit>().updateNextButtonStatus(isPhoneNumberInputValidated: isPhoneNumberInputValidated);
        },
        inputDecoration: const InputDecoration(
          hintText: phoneNumberText,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: customIndigoColor)),
        ),
        selectorConfig: const SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
        autoValidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialPhone,
        formatInput: false,
        inputBorder: const OutlineInputBorder(),
      ),
    );
  }
}
