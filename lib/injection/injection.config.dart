// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../interfaces/IAuthRepository.dart' as _i3;
import '../interfaces/IPostRepository.dart' as _i5;
import '../interfaces/ITicketRepository.dart' as _i7;
import '../services/auth/DevAuthRepository.dart' as _i4;
import '../services/post/DevPostRepository.dart' as _i6;
import '../services/ticket/DevTicketRepository.dart' as _i8;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.IAuthRepository>(_i4.DevAuthRepository(),
      registerFor: {_dev});
  gh.singleton<_i5.IPostRepository>(_i6.DevPostRepository(),
      registerFor: {_dev});
  gh.singleton<_i7.ITicketRepository>(_i8.DevTicketRepository(),
      registerFor: {_dev});
  return get;
}
