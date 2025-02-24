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
import '../../data/datasource_contract/subjects_datasource.dart' as _i4;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i7;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i5;
import '../../data/repo_impl/auth_repo_impl.dart' as _i13;
import '../../data/repo_impl/exams_repo_impl.dart' as _i9;
import '../../domain/repo_contract/auth_repo.dart' as _i12;
import '../../domain/repo_contract/subject_repo.dart' as _i8;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i16;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i14;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i20;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i18;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i15;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i10;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i22;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i23;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i17;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i21;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i19;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
    as _i11;
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
    gh.factory<_i4.SubjectDataSource>(
        () => _i5.SubjectDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthDatasource>(
        () => _i7.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SubjectRepo>(
        () => _i9.SubjectRepoImpl(gh<_i4.SubjectDataSource>()));
    gh.factory<_i10.GetAllExamsUsecase>(
        () => _i10.GetAllExamsUsecase(gh<_i8.SubjectRepo>()));
    gh.factory<_i11.ExploreViewModelCubit>(
        () => _i11.ExploreViewModelCubit(gh<_i10.GetAllExamsUsecase>()));
    gh.factory<_i12.AuthRepo>(
        () => _i13.AuthRepoImpl(gh<_i6.AuthDatasource>()));
    gh.factory<_i14.LoginUseCase>(() => _i14.LoginUseCase(gh<_i12.AuthRepo>()));
    gh.factory<_i15.VerifyUsecase>(
        () => _i15.VerifyUsecase(gh<_i12.AuthRepo>()));
    gh.factory<_i16.ForgetPasswordUsecase>(
        () => _i16.ForgetPasswordUsecase(gh<_i12.AuthRepo>()));
    gh.factory<_i17.VerificationViewModelCubit>(
        () => _i17.VerificationViewModelCubit(gh<_i15.VerifyUsecase>()));
    gh.factory<_i18.SignupUsecase>(
        () => _i18.SignupUsecase(gh<_i12.AuthRepo>()));
    gh.factory<_i19.SignupViewModelCubit>(
        () => _i19.SignupViewModelCubit(gh<_i18.SignupUsecase>()));
    gh.factory<_i20.ResetPasswordUsecase>(
        () => _i20.ResetPasswordUsecase(gh<_i12.AuthRepo>()));
    gh.factory<_i21.LoginViewModelCubit>(
        () => _i21.LoginViewModelCubit(gh<_i14.LoginUseCase>()));
    gh.factory<_i22.ForgetPasswordViewModelCubit>(() =>
        _i22.ForgetPasswordViewModelCubit(gh<_i16.ForgetPasswordUsecase>()));
    gh.factory<_i23.ResetPasswordViewModelCubit>(() =>
        _i23.ResetPasswordViewModelCubit(gh<_i20.ResetPasswordUsecase>()));
    return this;
  }
}
