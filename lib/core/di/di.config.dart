// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i4;
import '../../data/datasource_impl/login_impl_datasource.dart' as _i5;
import '../../data/repo_impl/auth_repo_impl.dart' as _i7;
import '../../domain/repo_contract/auth_repo.dart' as _i6;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i8;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i9;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i11;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i10;
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
    gh.factory<_i4.AuthDatasource>(
        () => _i5.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepo>(() => _i7.LoginRepoImpl(gh<_i4.AuthDatasource>()));
    gh.factory<_i8.LoginUseCase>(() => _i8.LoginUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i9.SignupUsecase>(() => _i9.SignupUsecase(gh<_i6.AuthRepo>()));
    gh.factory<_i10.SignupViewModelCubit>(
        () => _i10.SignupViewModelCubit(gh<_i9.SignupUsecase>()));
    gh.factory<_i11.LoginViewModelCubit>(
        () => _i11.LoginViewModelCubit(gh<_i8.LoginUseCase>()));
    return this;
  }
}
