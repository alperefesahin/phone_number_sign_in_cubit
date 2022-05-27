import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/custom_app_bar.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/constants/texts.dart';
import 'package:phone_number_sign_in/presentation/pages/verification_page/widgets/verification_page_body.dart';

class SignInVerificationPage extends StatelessWidget {
  const SignInVerificationPage({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PhoneNumberSignInState state;

  @override
  Widget build(BuildContext context) {
    final phoneNumber = state.phoneNumber;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        leadingOnPressed: () {
          AutoRouter.of(context).pop();
        },
        appBarBackgroundColor: whiteColor,
        appBarTitle: verificationText,
        appBarAction: Icons.lock,
        appBarLeading: Icons.arrow_back_ios,
        appBarTitleTextStyle: const TextStyle(color: blackColor, fontWeight: FontWeight.w500),
        appBarIconColor: blackColor,
      ),
      body: VerificationPageBody(phoneNumber: phoneNumber),
    );
  }
}
