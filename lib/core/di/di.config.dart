// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i17;
import '../../data/datasource_contract/exams_onsubject_datasource.dart' as _i11;
import '../../data/datasource_contract/profile_datasource.dart' as _i5;
import '../../data/datasource_contract/question_datasource.dart' as _i7;
import '../../data/datasource_contract/question_onexam_datasource.dart' as _i15;
import '../../data/datasource_contract/subjects_datasource.dart' as _i9;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i18;
import '../../data/datasource_impl/exams_onsubject_datasource_impl.dart'
    as _i12;
import '../../data/datasource_impl/profile_impl_datasource.dart' as _i6;
import '../../data/datasource_impl/question_impl_datasource.dart' as _i8;
import '../../data/datasource_impl/question_onexam_datasource_Impl.dart'
    as _i16;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i10;
import '../../data/repo_impl/auth_repo_impl.dart' as _i37;
import '../../data/repo_impl/exam_onsubject_repo_impl.dart' as _i24;
import '../../data/repo_impl/exams_repo_impl.dart' as _i20;
import '../../data/repo_impl/profile_repo_impl.dart' as _i14;
import '../../data/repo_impl/question_omexam_repo_impl.dart' as _i27;
import '../../data/repo_impl/question_repo_impl.dart' as _i30;
import '../../domain/repo_contract/auth_repo.dart' as _i36;
import '../../domain/repo_contract/exam_onsubject_repo.dart' as _i23;
import '../../domain/repo_contract/profile_repo.dart' as _i13;
import '../../domain/repo_contract/question_onexam_repo.dart' as _i26;
import '../../domain/repo_contract/question_repo.dart' as _i29;
import '../../domain/repo_contract/subject_repo.dart' as _i19;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i44;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i42;
import '../../domain/usecase/auth_usecase/logout_usecase.dart' as _i39;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i50;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i47;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i43;
import '../../domain/usecase/exam_onsubject_usecase.dart' as _i33;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i21;
import '../../domain/usecase/profile_usecase/change_password_usecase.dart'
    as _i22;
import '../../domain/usecase/profile_usecase/edit_profile_usecase.dart' as _i31;
import '../../domain/usecase/profile_usecase/profile_info_usecase.dart' as _i32;
import '../../domain/usecase/question_onexam_usecase.dart' as _i28;
import '../../domain/usecase/question_usecase/check_question_usecase.dart'
    as _i34;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i52;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i53;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i46;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i51;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i48;
import '../../presentation/exam/score_screen/view_model/score_view_model_cubit.dart'
    as _i45;
import '../../presentation/home/tabs/explore_tab/quiz_screen/view_model/question0nexam_cubit.dart'
    as _i35;
import '../../presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart'
    as _i49;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
    as _i25;
import '../../presentation/home/tabs/profile_tab/change_password/view_model/new_password_view_model_cubit.dart'
    as _i41;
import '../../presentation/home/tabs/profile_tab/edit_profile_screen/view_model/edit_profile_view_model_cubit.dart'
    as _i38;
import '../../presentation/home/tabs/profile_tab/edit_profile_screen/view_model/profile_screen_view_model_cubit.dart'
    as _i3;
import '../../presentation/home/tabs/profile_tab/profile_screen/view_model/profile_screen_view_model_cubit.dart'
    as _i40;
import '../api/api_manager.dart' as _i4;

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
    gh.factory<_i3.ProfileScreenViewModelCubit>(
        () => _i3.ProfileScreenViewModelCubit());
    gh.singleton<_i4.ApiManager>(() => _i4.ApiManager());
    gh.factory<_i5.ProfileDatasource>(
        () => _i6.ProfileDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i7.QuestionDatasource>(
        () => _i8.QuestionDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i9.SubjectDataSource>(
        () => _i10.SubjectDataSourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i11.ExamsOnSubjectsDatasource>(
        () => _i12.ExamsOnSubjectsDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i13.ProfileRepo>(
        () => _i14.ProfileRepoImpl(gh<_i5.ProfileDatasource>()));
    gh.factory<_i15.QuestionOnExamDatasource>(
        () => _i16.QuestionOnExamDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i17.AuthDatasource>(
        () => _i18.AuthDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i19.SubjectRepo>(
        () => _i20.SubjectRepoImpl(gh<_i9.SubjectDataSource>()));
    gh.factory<_i21.GetAllExamsUsecase>(
        () => _i21.GetAllExamsUsecase(gh<_i19.SubjectRepo>()));
    gh.factory<_i22.ChangePasswordUsecase>(
        () => _i22.ChangePasswordUsecase(gh<_i13.ProfileRepo>()));
    gh.factory<_i23.ExamOnSubjectRepo>(
        () => _i24.ExamOnSubjectRepoImpl(gh<_i11.ExamsOnSubjectsDatasource>()));
    gh.factory<_i25.ExploreViewModelCubit>(
        () => _i25.ExploreViewModelCubit(gh<_i21.GetAllExamsUsecase>()));
    gh.factory<_i26.QuestionOnexamRepo>(
        () => _i27.QuestionOnexamRepoImpl(gh<_i15.QuestionOnExamDatasource>()));
    gh.factory<_i28.QuestionOnexamUsecase>(
        () => _i28.QuestionOnexamUsecase(gh<_i26.QuestionOnexamRepo>()));
    gh.factory<_i29.QuestionRepo>(
        () => _i30.QuestionRepoImpl(gh<_i7.QuestionDatasource>()));
    gh.factory<_i31.EditProfileUsecase>(
        () => _i31.EditProfileUsecase(gh<_i13.ProfileRepo>()));
    gh.factory<_i32.ProfileInfoUsecase>(
        () => _i32.ProfileInfoUsecase(gh<_i13.ProfileRepo>()));
    gh.factory<_i33.ExamOnsubjectUsecase>(
        () => _i33.ExamOnsubjectUsecase(gh<_i23.ExamOnSubjectRepo>()));
    gh.factory<_i34.CheckQuestionUsecase>(
        () => _i34.CheckQuestionUsecase(gh<_i29.QuestionRepo>()));
    gh.factory<_i35.Question0nexamCubit>(
        () => _i35.Question0nexamCubit(gh<_i28.QuestionOnexamUsecase>()));
    gh.factory<_i36.AuthRepo>(
        () => _i37.AuthRepoImpl(gh<_i17.AuthDatasource>()));
    gh.factory<_i38.EditProfileViewModelCubit>(
        () => _i38.EditProfileViewModelCubit(gh<_i31.EditProfileUsecase>()));
    gh.factory<_i39.LogoutUseCase>(
        () => _i39.LogoutUseCase(gh<_i17.AuthDatasource>()));
    gh.factory<_i40.ProfileScreenViewModelCubit>(
        () => _i40.ProfileScreenViewModelCubit(gh<_i32.ProfileInfoUsecase>()));
    gh.factory<_i41.NewPasswordViewModelCubit>(
        () => _i41.NewPasswordViewModelCubit(gh<_i22.ChangePasswordUsecase>()));
    gh.factory<_i42.LoginUseCase>(() => _i42.LoginUseCase(gh<_i36.AuthRepo>()));
    gh.factory<_i43.VerifyUsecase>(
        () => _i43.VerifyUsecase(gh<_i36.AuthRepo>()));
    gh.factory<_i44.ForgetPasswordUsecase>(
        () => _i44.ForgetPasswordUsecase(gh<_i36.AuthRepo>()));
    gh.factory<_i45.ScoreViewModelCubit>(
        () => _i45.ScoreViewModelCubit(gh<_i34.CheckQuestionUsecase>()));
    gh.factory<_i46.VerificationViewModelCubit>(
        () => _i46.VerificationViewModelCubit(gh<_i43.VerifyUsecase>()));
    gh.factory<_i47.SignupUsecase>(
        () => _i47.SignupUsecase(gh<_i36.AuthRepo>()));
    gh.factory<_i48.SignupViewModelCubit>(
        () => _i48.SignupViewModelCubit(gh<_i47.SignupUsecase>()));
    gh.factory<_i49.SubjectOnExamCubit>(
        () => _i49.SubjectOnExamCubit(gh<_i33.ExamOnsubjectUsecase>()));
    gh.factory<_i50.ResetPasswordUsecase>(
        () => _i50.ResetPasswordUsecase(gh<_i36.AuthRepo>()));
    gh.factory<_i51.LoginViewModelCubit>(
        () => _i51.LoginViewModelCubit(gh<_i42.LoginUseCase>()));
    gh.factory<_i52.ForgetPasswordViewModelCubit>(() =>
        _i52.ForgetPasswordViewModelCubit(gh<_i44.ForgetPasswordUsecase>()));
    gh.factory<_i53.ResetPasswordViewModelCubit>(() =>
        _i53.ResetPasswordViewModelCubit(gh<_i50.ResetPasswordUsecase>()));
    return this;
  }
}
