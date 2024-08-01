// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'auth/service/auth-service-api.dart' as _i4;
import 'auth/service/auth-service-mock.dart' as _i5;
import 'auth/service/auth-service.dart' as _i3;
import 'home/service/message-service-api.dart' as _i7;
import 'home/service/message-service-mock.dart' as _i8;
import 'home/service/message-service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AuthService>(
    _i4.AuthServiceApi(),
    instanceName: 'api',
  );
  gh.singleton<_i3.AuthService>(
    _i5.AuthServiceMock(),
    instanceName: 'mock',
  );
  gh.singleton<_i6.MessageService>(
    _i7.MessageServiceApi(),
    instanceName: 'api',
  );
  gh.singleton<_i6.MessageService>(
    _i8.MessageServiceMock(),
    instanceName: 'mock',
  );
  return get;
}
