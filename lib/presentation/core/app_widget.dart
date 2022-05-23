import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_sign_in/application/auth/auth_cubit.dart';
import 'package:phone_number_sign_in/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: 'Phone Number Sign-In',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
