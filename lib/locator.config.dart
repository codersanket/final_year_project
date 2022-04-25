// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i11;
import 'application/auth/login/login_cubit.dart' as _i8;
import 'application/auth/register/register_cubit.dart' as _i9;
import 'application/manufaturer/add_product/cubit/add_product_cubit.dart'
    as _i10;
import 'domain/auth/iauth.dart' as _i4;
import 'domain/blockchain/connection.dart' as _i3;
import 'domain/manufacturer/imanufacturer.dart' as _i6;
import 'infrastructure/repo/auth_repo.dart' as _i5;
import 'infrastructure/repo/manufacturer.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BlockChain>(() => _i3.BlockChain());
  gh.factory<_i4.IAuth>(() => _i5.AuthRepo());
  gh.factory<_i6.Imanufacturer>(
      () => _i7.Manufacturer(chain: get<_i3.BlockChain>()));
  gh.factory<_i8.LoginCubit>(() => _i8.LoginCubit(authRepo: get<_i4.IAuth>()));
  gh.factory<_i9.RegisterCubit>(
      () => _i9.RegisterCubit(auth: get<_i4.IAuth>()));
  gh.factory<_i10.AddProductCubit>(
      () => _i10.AddProductCubit(man: get<_i6.Imanufacturer>()));
  gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(authRepo: get<_i4.IAuth>()));
  return get;
}
