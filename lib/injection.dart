import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_number_sign_in/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
