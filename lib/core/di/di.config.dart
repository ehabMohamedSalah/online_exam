// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasource_contract/auth_datasource.dart' as _i214;
import '../../data/datasource_contract/exams_onsubject_datasource.dart'
    as _i1065;
import '../../data/datasource_contract/profile_datasource.dart' as _i392;
import '../../data/datasource_contract/question_datasource.dart' as _i620;
import '../../data/datasource_contract/question_onexam_datasource.dart'
    as _i534;
import '../../data/datasource_contract/subjects_datasource.dart' as _i145;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i533;
import '../../data/datasource_impl/exams_onsubject_datasource_impl.dart'
    as _i498;
import '../../data/datasource_impl/profile_impl_datasource.dart' as _i414;
import '../../data/datasource_impl/question_impl_datasource.dart' as _i958;
import '../../data/datasource_impl/question_onexam_datasource_Impl.dart'
    as _i608;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i775;
import '../../data/repo_impl/auth_repo_impl.dart' as _i540;
import '../../data/repo_impl/exam_onsubject_repo_impl.dart' as _i838;
import '../../data/repo_impl/exams_repo_impl.dart' as _i230;
import '../../data/repo_impl/profile_repo_impl.dart' as _i549;
import '../../data/repo_impl/question_omexam_repo_impl.dart' as _i13;
import '../../data/repo_impl/question_repo_impl.dart' as _i998;
import '../../domain/repo_contract/auth_repo.dart' as _i233;
import '../../domain/repo_contract/exam_onsubject_repo.dart' as _i447;
import '../../domain/repo_contract/profile_repo.dart' as _i772;
import '../../domain/repo_contract/question_onexam_repo.dart' as _i148;
import '../../domain/repo_contract/question_repo.dart' as _i137;
import '../../domain/repo_contract/subject_repo.dart' as _i367;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart'
    as _i403;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i593;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i769;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i171;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i75;
import '../../domain/usecase/exam_onsubject_usecase.dart' as _i336;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i52;
import '../../domain/usecase/profile_usecase/change_password_usecase.dart'
    as _i670;
import '../../domain/usecase/profile_usecase/edit_profile_usecase.dart'
    as _i393;
import '../../domain/usecase/profile_usecase/profile_info_usecase.dart'
    as _i729;
import '../../domain/usecase/question_onexam_usecase.dart' as _i16;
import '../../domain/usecase/question_usecase/check_question_usecase.dart'
    as _i232;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i540;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i479;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i717;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i498;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i818;
import '../../presentation/home/tabs/explore_tab/quiz_screen/view_model/question0nexam_cubit.dart'
    as _i885;
import '../../presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart'
    as _i782;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
    as _i565;
import '../../presentation/home/tabs/profile_tab/edit_profile_screen/view_model/edit_profile_view_model_cubit.dart'
    as _i778;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i392.ProfileDatasource>(
        () => _i414.ProfileDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i620.QuestionDatasource>(
        () => _i958.QuestionDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i145.SubjectDataSource>(
        () => _i775.SubjectDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1065.ExamsOnSubjectsDatasource>(
        () => _i498.ExamsOnSubjectsDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i772.ProfileRepo>(
        () => _i549.ProfileRepoImpl(gh<_i392.ProfileDatasource>()));
    gh.factory<_i534.QuestionOnExamDatasource>(
        () => _i608.QuestionOnExamDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i214.AuthDatasource>(
        () => _i533.AuthDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i367.SubjectRepo>(
        () => _i230.SubjectRepoImpl(gh<_i145.SubjectDataSource>()));
    gh.factory<_i52.GetAllExamsUsecase>(
        () => _i52.GetAllExamsUsecase(gh<_i367.SubjectRepo>()));
    gh.factory<_i670.ChangePasswordUsecase>(
        () => _i670.ChangePasswordUsecase(gh<_i772.ProfileRepo>()));
    gh.factory<_i447.ExamOnSubjectRepo>(() =>
        _i838.ExamOnSubjectRepoImpl(gh<_i1065.ExamsOnSubjectsDatasource>()));
    gh.factory<_i565.ExploreViewModelCubit>(
        () => _i565.ExploreViewModelCubit(gh<_i52.GetAllExamsUsecase>()));
    gh.factory<_i148.QuestionOnexamRepo>(() =>
        _i13.QuestionOnexamRepoImpl(gh<_i534.QuestionOnExamDatasource>()));
    gh.factory<_i16.QuestionOnexamUsecase>(
        () => _i16.QuestionOnexamUsecase(gh<_i148.QuestionOnexamRepo>()));
    gh.factory<_i137.QuestionRepo>(
        () => _i998.QuestionRepoImpl(gh<_i620.QuestionDatasource>()));
    gh.factory<_i393.EditProfileUsecase>(
        () => _i393.EditProfileUsecase(gh<_i772.ProfileRepo>()));
    gh.factory<_i729.ProfileInfoUsecase>(
        () => _i729.ProfileInfoUsecase(gh<_i772.ProfileRepo>()));
    gh.factory<_i336.ExamOnsubjectUsecase>(
        () => _i336.ExamOnsubjectUsecase(gh<_i447.ExamOnSubjectRepo>()));
    gh.factory<_i232.CheckQuestionUsecase>(
        () => _i232.CheckQuestionUsecase(gh<_i137.QuestionRepo>()));
    gh.factory<_i885.Question0nexamCubit>(
        () => _i885.Question0nexamCubit(gh<_i16.QuestionOnexamUsecase>()));
    gh.factory<_i233.AuthRepo>(
        () => _i540.AuthRepoImpl(gh<_i214.AuthDatasource>()));
    gh.factory<_i778.EditProfileViewModelCubit>(
        () => _i778.EditProfileViewModelCubit(gh<_i393.EditProfileUsecase>()));
    gh.factory<_i593.LoginUseCase>(
        () => _i593.LoginUseCase(gh<_i233.AuthRepo>()));
    gh.factory<_i75.VerifyUsecase>(
        () => _i75.VerifyUsecase(gh<_i233.AuthRepo>()));
    gh.factory<_i403.ForgetPasswordUsecase>(
        () => _i403.ForgetPasswordUsecase(gh<_i233.AuthRepo>()));
    gh.factory<_i717.VerificationViewModelCubit>(
        () => _i717.VerificationViewModelCubit(gh<_i75.VerifyUsecase>()));
    gh.factory<_i171.SignupUsecase>(
        () => _i171.SignupUsecase(gh<_i233.AuthRepo>()));
    gh.factory<_i818.SignupViewModelCubit>(
        () => _i818.SignupViewModelCubit(gh<_i171.SignupUsecase>()));
    gh.factory<_i782.SubjectOnExamCubit>(
        () => _i782.SubjectOnExamCubit(gh<_i336.ExamOnsubjectUsecase>()));
    gh.factory<_i769.ResetPasswordUsecase>(
        () => _i769.ResetPasswordUsecase(gh<_i233.AuthRepo>()));
    gh.factory<_i498.LoginViewModelCubit>(
        () => _i498.LoginViewModelCubit(gh<_i593.LoginUseCase>()));
    gh.factory<_i540.ForgetPasswordViewModelCubit>(() =>
        _i540.ForgetPasswordViewModelCubit(gh<_i403.ForgetPasswordUsecase>()));
    gh.factory<_i479.ResetPasswordViewModelCubit>(() =>
        _i479.ResetPasswordViewModelCubit(gh<_i769.ResetPasswordUsecase>()));
    return this;
  }
}
