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
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i5;
import '../../data/repo_impl/auth_repo_impl.dart' as _i7;
import '../../domain/repo_contract/auth_repo.dart' as _i6;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i10;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i8;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i14;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i12;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i9;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i16;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i17;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i11;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i15;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i13;
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
    gh.factory<_i6.AuthRepo>(() => _i7.AuthRepoImpl(gh<_i4.AuthDatasource>()));
    gh.factory<_i8.LoginUseCase>(() => _i8.LoginUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i9.VerifyUsecase>(() => _i9.VerifyUsecase(gh<_i6.AuthRepo>()));
    gh.factory<_i10.ForgetPasswordUsecase>(
        () => _i10.ForgetPasswordUsecase(gh<_i6.AuthRepo>()));
    gh.factory<_i11.VerificationViewModelCubit>(
        () => _i11.VerificationViewModelCubit(gh<_i9.VerifyUsecase>()));
    gh.factory<_i12.SignupUsecase>(
        () => _i12.SignupUsecase(gh<_i6.AuthRepo>()));
    gh.factory<_i13.SignupViewModelCubit>(
        () => _i13.SignupViewModelCubit(gh<_i12.SignupUsecase>()));
    gh.factory<_i14.ResetPasswordUsecase>(
        () => _i14.ResetPasswordUsecase(gh<_i6.AuthRepo>()));
    gh.factory<_i15.LoginViewModelCubit>(
        () => _i15.LoginViewModelCubit(gh<_i8.LoginUseCase>()));
    gh.factory<_i16.ForgetPasswordViewModelCubit>(() =>
        _i16.ForgetPasswordViewModelCubit(gh<_i10.ForgetPasswordUsecase>()));
    gh.factory<_i17.ResetPasswordViewModelCubit>(() =>
        _i17.ResetPasswordViewModelCubit(gh<_i14.ResetPasswordUsecase>()));
    return this;
  }
}
