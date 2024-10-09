import 'package:get_it/get_it.dart';
import 'package:veda_task/config/di/get_injectable.config.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'servicesLocator',
  usesNullSafety: true,
  generateForDir: ['lib'],
)
GetIt configureDependencies() => locator.servicesLocator();

// dart run build_runner watch --delete-conflicting-outputs

