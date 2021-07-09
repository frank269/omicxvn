// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:omicxvn/interfaces/IAuthRepository.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/services/auth/DevAuthRepository.dart';
import 'package:omicxvn/services/ticket/DevTicketRepository.dart';

import '../interfaces/IPostRepository.dart' as _i3;
import '../services/post/DevPostRepository.dart' as _i4;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.IPostRepository>(_i4.DevPostRepository(),
      registerFor: {_dev});
  gh.singleton<ITicketRepository>(DevTicketRepository(), registerFor: {_dev});
  gh.singleton<IAuthRepository>(DevAuthRepository(), registerFor: {_dev});
  return get;
}
