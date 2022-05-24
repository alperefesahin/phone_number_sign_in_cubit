import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/constants/texts.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
