import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_sign_in/application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/custom_app_bar.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/constants/texts.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/widgets/sign_in_page_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneNumberSignInCubit(),
      child: Scaffold(
        appBar: CustomAppBar(appBarTitle: signInText, appBarAction: CupertinoIcons.line_horizontal_3_decrease),
        body: const SignInPageBody(),
      ),
    );
  }
}
