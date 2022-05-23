// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/sign_in/sign_in_page.dart' as _i1;
import '../pages/validation_page/sign_in_validation_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SignInPage());
    },
    SignInValidationRoute.name: (routeData) {
      final args = routeData.argsAs<SignInValidationRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SignInValidationPage(
              key: args.key, phoneNumber: args.phoneNumber));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SignInRoute.name, path: '/'),
        _i3.RouteConfig(SignInValidationRoute.name,
            path: '/sign-in-validation-page')
      ];
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i3.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.SignInValidationPage]
class SignInValidationRoute
    extends _i3.PageRouteInfo<SignInValidationRouteArgs> {
  SignInValidationRoute({_i4.Key? key, required String phoneNumber})
      : super(SignInValidationRoute.name,
            path: '/sign-in-validation-page',
            args:
                SignInValidationRouteArgs(key: key, phoneNumber: phoneNumber));

  static const String name = 'SignInValidationRoute';
}

class SignInValidationRouteArgs {
  const SignInValidationRouteArgs({this.key, required this.phoneNumber});

  final _i4.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SignInValidationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}
