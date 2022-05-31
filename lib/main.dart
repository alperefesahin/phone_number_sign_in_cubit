import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/firebase_options.dart';
import 'package:phone_number_sign_in/injection.dart';
import 'package:phone_number_sign_in/presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const AppWidget());
}
