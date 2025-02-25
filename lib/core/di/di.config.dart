// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i8;
import '../../data/datasource_contract/exams_onsubject_datasource.dart' as _i6;
import '../../data/datasource_contract/subjects_datasource.dart' as _i4;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i9;
import '../../data/datasource_impl/exams_onsubject_datasource_impl.dart' as _i7;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i5;
import '../../data/repo_impl/auth_repo_impl.dart' as _i18;
import '../../data/repo_impl/exam_onsubject_repo_impl.dart' as _i14;
import '../../data/repo_impl/exams_repo_impl.dart' as _i11;
import '../../domain/repo_contract/auth_repo.dart' as _i17;
import '../../domain/repo_contract/exam_onsubject_repo.dart' as _i13;
import '../../domain/repo_contract/subject_repo.dart' as _i10;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i21;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i19;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i26;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i23;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i20;
import '../../domain/usecase/exam_onsubject_usecase.dart' as _i16;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i12;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i28;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i29;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i22;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i27;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i24;
import '../../presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart'
    as _i25;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
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
    gh.factory<_i4.SubjectDataSource>(
        () => _i5.SubjectDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ExamsOnSubjectsDatasource>(
        () => _i7.ExamsOnSubjectsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.AuthDatasource>(
        () => _i9.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.SubjectRepo>(
        () => _i11.SubjectRepoImpl(gh<_i4.SubjectDataSource>()));
    gh.factory<_i12.GetAllExamsUsecase>(
        () => _i12.GetAllExamsUsecase(gh<_i10.SubjectRepo>()));
    gh.factory<_i13.ExamOnSubjectRepo>(
        () => _i14.ExamOnSubjectRepoImpl(gh<_i6.ExamsOnSubjectsDatasource>()));
    gh.factory<_i15.ExploreViewModelCubit>(
        () => _i15.ExploreViewModelCubit(gh<_i12.GetAllExamsUsecase>()));
    gh.factory<_i16.ExamOnsubjectUsecase>(
        () => _i16.ExamOnsubjectUsecase(gh<_i13.ExamOnSubjectRepo>()));
    gh.factory<_i17.AuthRepo>(
        () => _i18.AuthRepoImpl(gh<_i8.AuthDatasource>()));
    gh.factory<_i19.LoginUseCase>(() => _i19.LoginUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i20.VerifyUsecase>(
        () => _i20.VerifyUsecase(gh<_i17.AuthRepo>()));
    gh.factory<_i21.ForgetPasswordUsecase>(
        () => _i21.ForgetPasswordUsecase(gh<_i17.AuthRepo>()));
    gh.factory<_i22.VerificationViewModelCubit>(
        () => _i22.VerificationViewModelCubit(gh<_i20.VerifyUsecase>()));
    gh.factory<_i23.SignupUsecase>(
        () => _i23.SignupUsecase(gh<_i17.AuthRepo>()));
    gh.factory<_i24.SignupViewModelCubit>(
        () => _i24.SignupViewModelCubit(gh<_i23.SignupUsecase>()));
    gh.factory<_i25.SubjectOnExamCubit>(
        () => _i25.SubjectOnExamCubit(gh<_i16.ExamOnsubjectUsecase>()));
    gh.factory<_i26.ResetPasswordUsecase>(
        () => _i26.ResetPasswordUsecase(gh<_i17.AuthRepo>()));
    gh.factory<_i27.LoginViewModelCubit>(
        () => _i27.LoginViewModelCubit(gh<_i19.LoginUseCase>()));
    gh.factory<_i28.ForgetPasswordViewModelCubit>(() =>
        _i28.ForgetPasswordViewModelCubit(gh<_i21.ForgetPasswordUsecase>()));
    gh.factory<_i29.ResetPasswordViewModelCubit>(() =>
        _i29.ResetPasswordViewModelCubit(gh<_i26.ResetPasswordUsecase>()));
    return this;
  }
}
