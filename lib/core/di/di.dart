 import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/di/di.config.dart';
//hy3mlo generate fe al file da (di)

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies()   => getIt.init();