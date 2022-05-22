import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_sign_in/application/auth/auth_cubit.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in_page/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const MaterialApp(
        title: 'Phone Number Sign-In',
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
