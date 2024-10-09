// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:veda_task/config/di/modules.dart' as _i465;
import 'package:veda_task/drift_database/db_connector.dart' as _i4;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt servicesLocator({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModules = _$DiModules();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => diModules.flutterSecureStorage);
    gh.lazySingleton<_i4.PlantDatabase>(() => _i4.PlantDatabase());
    return this;
  }
}

class _$DiModules extends _i465.DiModules {}
