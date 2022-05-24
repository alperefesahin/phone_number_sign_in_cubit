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
import '../pages/verification_page/sign_in_verification_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SignInPage());
    },
    SignInVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<SignInVerificationRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SignInVerificationPage(
              key: args.key, phoneNumber: args.phoneNumber));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SignInRoute.name, path: '/'),
        _i3.RouteConfig(SignInVerificationRoute.name,
            path: '/sign-in-verification-page')
      ];
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i3.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.SignInVerificationPage]
class SignInVerificationRoute
    extends _i3.PageRouteInfo<SignInVerificationRouteArgs> {
  SignInVerificationRoute({_i4.Key? key, required String phoneNumber})
      : super(SignInVerificationRoute.name,
            path: '/sign-in-verification-page',
            args: SignInVerificationRouteArgs(
                key: key, phoneNumber: phoneNumber));

  static const String name = 'SignInVerificationRoute';
}

class SignInVerificationRouteArgs {
  const SignInVerificationRouteArgs({this.key, required this.phoneNumber});

  final _i4.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SignInVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}
