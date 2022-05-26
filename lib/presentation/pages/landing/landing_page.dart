import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_sign_in/application/auth/auth_cubit.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/custom_progress_indicator.dart';
import 'package:phone_number_sign_in/presentation/routes/router.gr.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool isUserLoggedIn = context.read<AuthCubit>().state.isUserLoggedIn;
      if (isUserLoggedIn) {
        AutoRouter.of(context).replace(const HomeRoute());
      } else if (!isUserLoggedIn) {
        AutoRouter.of(context).replace(const SignInRoute());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.isUserLoggedIn != current.isUserLoggedIn,
      listener: (context, state) {
        if (state.isUserLoggedIn) {
          AutoRouter.of(context).replace(const HomeRoute());
        } else {
          AutoRouter.of(context).replace(const SignInRoute());
        }
      },
      child: const Scaffold(body: CustomProgressIndicator()),
    );
  }
}
