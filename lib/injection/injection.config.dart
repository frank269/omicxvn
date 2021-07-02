// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../interfaces/IPostRepository.dart' as _i3;
import '../services/post/DevPostRepository.dart' as _i4;
import '../services/post/ProdPostRepository.dart' as _i5;

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
  gh.singleton<_i3.IPostRepository>(_i5.ProdPostRepository(),
      registerFor: {_prod});
  return get;
}
