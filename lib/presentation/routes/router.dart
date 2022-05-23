// ignore: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:phone_number_sign_in/presentation/pages/sign_in/sign_in_page.dart';
import 'package:phone_number_sign_in/presentation/pages/validation_page/sign_in_validation_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage, initial: true),
    AutoRoute(page: SignInValidationPage),
  ],
)
class $AppRouter {}
