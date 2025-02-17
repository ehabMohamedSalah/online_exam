// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i6;
import '../../data/datasource_contract/verify_datasource.dart' as _i4;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i7;
import '../../data/datasource_impl/verify_impl_datasource.dart' as _i5;
import '../../data/repo_impl/auth_repo_impl.dart' as _i11;
import '../../domain/repo_contract/auth_repo.dart' as _i10;
import '../../domain/repo_contract/verify_repo.dart' as _i9;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i13;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i12;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i14;
import '../../domain/usecase/verify_usecase.dart' as _i8;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i17;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i16;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i15;
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
    gh.factory<_i4.VerifyDatasource>(
        () => _i5.VerifyDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthDatasource>(
        () => _i7.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.VerifyUseCase>(
        () => _i8.VerifyUseCase(gh<_i9.VerifyRepo>()));
    gh.factory<_i10.AuthRepo>(
        () => _i11.LoginRepoImpl(gh<_i6.AuthDatasource>()));
    gh.factory<_i12.LoginUseCase>(() => _i12.LoginUseCase(gh<_i10.AuthRepo>()));
    gh.factory<_i13.ForgetPasswordUsecase>(
        () => _i13.ForgetPasswordUsecase(gh<_i10.AuthRepo>()));
    gh.factory<_i14.SignupUsecase>(
        () => _i14.SignupUsecase(gh<_i10.AuthRepo>()));
    gh.factory<_i15.SignupViewModelCubit>(
        () => _i15.SignupViewModelCubit(gh<_i14.SignupUsecase>()));
    gh.factory<_i16.LoginViewModelCubit>(
        () => _i16.LoginViewModelCubit(gh<_i12.LoginUseCase>()));
    gh.factory<_i17.ForgetPasswordViewModelCubit>(() =>
        _i17.ForgetPasswordViewModelCubit(gh<_i13.ForgetPasswordUsecase>()));
    return this;
  }
}
