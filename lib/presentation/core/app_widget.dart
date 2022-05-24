import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_sign_in/application/auth/auth_cubit.dart';
import 'package:phone_number_sign_in/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    final botToastBuilder = BotToastInit();
    final BotToastNavigatorObserver botToastNavigatorObserver = BotToastNavigatorObserver();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp.router(
        title: 'Phone Number Sign-In',
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(
          navigatorObservers: () => [
            botToastNavigatorObserver,
          ],
        ),
        builder: (context, child) {
          return botToastBuilder(context, child);
        },
      ),
    );
  }
}
