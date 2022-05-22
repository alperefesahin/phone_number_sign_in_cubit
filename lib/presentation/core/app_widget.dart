import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone Number Sign-In',
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
