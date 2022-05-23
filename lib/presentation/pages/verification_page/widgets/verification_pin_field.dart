import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPinField extends StatelessWidget {
  const VerificationPinField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.15,
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              border: Border.all(color: whiteColor, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          PinCodeTextField(
            backgroundColor: transparentColor,
            mainAxisAlignment: MainAxisAlignment.center,
            appContext: context,
            length: 4,
            onChanged: (String value) {},
            textStyle: const TextStyle(color: whiteColor),
            keyboardType: TextInputType.phone,
            hintCharacter: "-",
            hintStyle: const TextStyle(color: whiteColor),
            pinTheme: PinTheme(
                fieldOuterPadding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 65,
                fieldWidth: 65,
                inactiveColor: customIndigoBackgroundColor,
                activeColor: customIndigoBackgroundColor,
                selectedColor: customIndigoBackgroundColor),
          ),
        ],
      ),
    );
  }
}
