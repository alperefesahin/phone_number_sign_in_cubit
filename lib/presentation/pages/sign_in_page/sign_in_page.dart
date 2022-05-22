import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/custom_app_bar.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/constants/texts.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/widgets/sign_in_page_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: signInText, appBarAction: CupertinoIcons.line_horizontal_3_decrease),
      body: const SignInPageBody(),
    );
  }
}
