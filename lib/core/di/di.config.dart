// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i10;
import '../../data/datasource_contract/exams_onsubject_datasource.dart' as _i6;
import '../../data/datasource_contract/question_onexam_datasource.dart' as _i8;
import '../../data/datasource_contract/subjects_datasource.dart' as _i4;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i11;
import '../../data/datasource_impl/exams_onsubject_datasource_impl.dart' as _i7;
import '../../data/datasource_impl/question_onexam_datasource_Impl.dart' as _i9;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i5;
import '../../data/repo_impl/auth_repo_impl.dart' as _i24;
import '../../data/repo_impl/exam_onsubject_repo_impl.dart' as _i16;
import '../../data/repo_impl/exams_repo_impl.dart' as _i13;
import '../../data/repo_impl/question_omexam_repo_impl.dart' as _i19;
import '../../domain/repo_contract/auth_repo.dart' as _i23;
import '../../domain/repo_contract/exam_onsubject_repo.dart' as _i15;
import '../../domain/repo_contract/question_onexam_repo.dart' as _i18;
import '../../domain/repo_contract/subject_repo.dart' as _i12;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i27;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i25;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i32;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i29;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i26;
import '../../domain/usecase/exam_onsubject_usecase.dart' as _i21;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i14;
import '../../domain/usecase/question_onexam_usecase.dart' as _i20;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i34;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i35;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i28;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i33;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i30;
import '../../presentation/home/tabs/explore_tab/quiz_screen/view_model/question0nexam_cubit.dart'
    as _i22;
import '../../presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart'
    as _i31;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
    as _i17;
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
    gh.factory<_i8.QuestionOnExamDatasource>(
        () => _i9.QuestionOnExamDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.AuthDatasource>(
        () => _i11.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.SubjectRepo>(
        () => _i13.SubjectRepoImpl(gh<_i4.SubjectDataSource>()));
    gh.factory<_i14.GetAllExamsUsecase>(
        () => _i14.GetAllExamsUsecase(gh<_i12.SubjectRepo>()));
    gh.factory<_i15.ExamOnSubjectRepo>(
        () => _i16.ExamOnSubjectRepoImpl(gh<_i6.ExamsOnSubjectsDatasource>()));
    gh.factory<_i17.ExploreViewModelCubit>(
        () => _i17.ExploreViewModelCubit(gh<_i14.GetAllExamsUsecase>()));
    gh.factory<_i18.QuestionOnexamRepo>(
        () => _i19.QuestionOnexamRepoImpl(gh<_i8.QuestionOnExamDatasource>()));
    gh.factory<_i20.QuestionOnexamUsecase>(
        () => _i20.QuestionOnexamUsecase(gh<_i18.QuestionOnexamRepo>()));
    gh.factory<_i21.ExamOnsubjectUsecase>(
        () => _i21.ExamOnsubjectUsecase(gh<_i15.ExamOnSubjectRepo>()));
    gh.factory<_i22.Question0nexamCubit>(
        () => _i22.Question0nexamCubit(gh<_i20.QuestionOnexamUsecase>()));
    gh.factory<_i23.AuthRepo>(
        () => _i24.AuthRepoImpl(gh<_i10.AuthDatasource>()));
    gh.factory<_i25.LoginUseCase>(() => _i25.LoginUseCase(gh<_i23.AuthRepo>()));
    gh.factory<_i26.VerifyUsecase>(
        () => _i26.VerifyUsecase(gh<_i23.AuthRepo>()));
    gh.factory<_i27.ForgetPasswordUsecase>(
        () => _i27.ForgetPasswordUsecase(gh<_i23.AuthRepo>()));
    gh.factory<_i28.VerificationViewModelCubit>(
        () => _i28.VerificationViewModelCubit(gh<_i26.VerifyUsecase>()));
    gh.factory<_i29.SignupUsecase>(
        () => _i29.SignupUsecase(gh<_i23.AuthRepo>()));
    gh.factory<_i30.SignupViewModelCubit>(
        () => _i30.SignupViewModelCubit(gh<_i29.SignupUsecase>()));
    gh.factory<_i31.SubjectOnExamCubit>(
        () => _i31.SubjectOnExamCubit(gh<_i21.ExamOnsubjectUsecase>()));
    gh.factory<_i32.ResetPasswordUsecase>(
        () => _i32.ResetPasswordUsecase(gh<_i23.AuthRepo>()));
    gh.factory<_i33.LoginViewModelCubit>(
        () => _i33.LoginViewModelCubit(gh<_i25.LoginUseCase>()));
    gh.factory<_i34.ForgetPasswordViewModelCubit>(() =>
        _i34.ForgetPasswordViewModelCubit(gh<_i27.ForgetPasswordUsecase>()));
    gh.factory<_i35.ResetPasswordViewModelCubit>(() =>
        _i35.ResetPasswordViewModelCubit(gh<_i32.ResetPasswordUsecase>()));
    return this;
  }
}
