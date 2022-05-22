import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/constants/texts.dart';

class BottomSectionOfThePage extends StatelessWidget {
  const BottomSectionOfThePage({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: size.height / 3, right: 25, left: 25, bottom: 25),
        child: SizedBox(
          height: size.height / 2,
          width: size.width,
          child: Card(
            color: whiteColor,
            elevation: 4.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Row(
                    children: const [
                      AutoSizeText(
                        personalInformationText,
                        minFontSize: 20,
                        maxFontSize: 25,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: InternationalPhoneNumberInput(
                    inputDecoration: const InputDecoration(
                      hintText: phoneNumberText,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customIndigoColor),
                      ),
                    ),
                    onInputChanged: (PhoneNumber number) {},
                    onInputValidated: (bool value) {},
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: PhoneNumber(phoneNumber: "123123123"),
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(),
                    onSaved: (PhoneNumber number) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
                  child: AutoSizeText(
                    smsInformationMessage,
                    minFontSize: 15,
                    maxFontSize: 20,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: greyColor),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      color: customIndigoColor,
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                      boxShadow: [
                        BoxShadow(
                          color: customIndigoColor.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 30,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_forward, size: 40, color: whiteColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
