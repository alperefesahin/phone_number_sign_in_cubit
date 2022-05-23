import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/constants/texts.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/widgets/verification_confirm_button.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/widgets/verification_pin_field.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/widgets/wave_animation.dart';

class VerificationPageBody extends StatelessWidget {
  const VerificationPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomWaveAnimation(),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 20, top: 5),
                        child: Icon(
                          Icons.check_rounded,
                          size: 25,
                          color: whiteColor,
                        ),
                      ),
                      AutoSizeText(
                        confirmationText,
                        minFontSize: 30,
                        maxFontSize: 35,
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    top: 25,
                    right: 25,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.vibration, size: 50, color: whiteColor),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: AutoSizeText(
                            confirmationInfoText,
                            minFontSize: 18,
                            maxFontSize: 25,
                            maxLines: 2,
                            style: TextStyle(
                              color: confirmationTextColor,
                              height: 1.75,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const VerificationPinField(),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25),
                  child: InkWell(
                    onTap: () {},
                    splashColor: transparentColor,
                    highlightColor: transparentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          AutoSizeText(
                            resendCodeText,
                            minFontSize: 15,
                            maxFontSize: 20,
                            style: TextStyle(
                              color: confirmationTextColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const VerificationConfirmButton()
              ],
            ),
          ),
        )
      ],
    );
  }
}
