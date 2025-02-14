// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/login_datasource.dart' as _i4;
import '../../data/datasource_impl/login_impl_datasource.dart' as _i5;
import '../../data/repo_impl/login_repo_impl.dart' as _i7;
import '../../domain/repo_contract/login_repo.dart' as _i6;
import '../../domain/usecase/login_usecase.dart' as _i8;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.LoginDatasource>(
        () => _i5.LoginDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.LoginRepo>(
        () => _i7.LoginRepoImpl(gh<_i4.LoginDatasource>()));
    gh.factory<_i8.LoginUseCase>(() => _i8.LoginUseCase(gh<_i6.LoginRepo>()));
    gh.factory<_i9.LoginViewModelCubit>(
        () => _i9.LoginViewModelCubit(gh<_i8.LoginUseCase>()));
    return this;
  }
}
