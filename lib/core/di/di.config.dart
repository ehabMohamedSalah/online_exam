// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i16;
import '../../data/datasource_contract/exams_onsubject_datasource.dart' as _i10;
import '../../data/datasource_contract/profile_datasource.dart' as _i4;
import '../../data/datasource_contract/question_datasource.dart' as _i6;
import '../../data/datasource_contract/question_onexam_datasource.dart' as _i14;
import '../../data/datasource_contract/subjects_datasource.dart' as _i8;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i17;
import '../../data/datasource_impl/exams_onsubject_datasource_impl.dart'
    as _i11;
import '../../data/datasource_impl/profile_impl_datasource.dart' as _i5;
import '../../data/datasource_impl/question_impl_datasource.dart' as _i7;
import '../../data/datasource_impl/question_onexam_datasource_Impl.dart'
    as _i15;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i9;
import '../../data/repo_impl/auth_repo_impl.dart' as _i36;
import '../../data/repo_impl/exam_onsubject_repo_impl.dart' as _i23;
import '../../data/repo_impl/exams_repo_impl.dart' as _i19;
import '../../data/repo_impl/profile_repo_impl.dart' as _i13;
import '../../data/repo_impl/question_omexam_repo_impl.dart' as _i26;
import '../../data/repo_impl/question_repo_impl.dart' as _i29;
import '../../domain/repo_contract/auth_repo.dart' as _i35;
import '../../domain/repo_contract/exam_onsubject_repo.dart' as _i22;
import '../../domain/repo_contract/profile_repo.dart' as _i12;
import '../../domain/repo_contract/question_onexam_repo.dart' as _i25;
import '../../domain/repo_contract/question_repo.dart' as _i28;
import '../../domain/repo_contract/subject_repo.dart' as _i18;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i40;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i38;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i45;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i42;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i39;
import '../../domain/usecase/exam_onsubject_usecase.dart' as _i32;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i20;
import '../../domain/usecase/profile_usecase/change_password_usecase.dart'
    as _i21;
import '../../domain/usecase/profile_usecase/edit_profile_usecase.dart' as _i30;
import '../../domain/usecase/profile_usecase/profile_info_usecase.dart' as _i31;
import '../../domain/usecase/question_onexam_usecase.dart' as _i27;
import '../../domain/usecase/question_usecase/check_question_usecase.dart'
    as _i33;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i47;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i48;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i41;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i46;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i43;
import '../../presentation/home/tabs/explore_tab/quiz_screen/view_model/question0nexam_cubit.dart'
    as _i34;
import '../../presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart'
    as _i44;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
    as _i24;
import '../../presentation/home/tabs/profile_tab/edit_profile_screen/view_model/edit_profile_view_model_cubit.dart'
    as _i37;
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
    gh.factory<_i4.ProfileDatasource>(
        () => _i5.ProfileDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.QuestionDatasource>(
        () => _i7.QuestionDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SubjectDataSource>(
        () => _i9.SubjectDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.ExamsOnSubjectsDatasource>(
        () => _i11.ExamsOnSubjectsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.ProfileRepo>(
        () => _i13.ProfileRepoImpl(gh<_i4.ProfileDatasource>()));
    gh.factory<_i14.QuestionOnExamDatasource>(
        () => _i15.QuestionOnExamDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.AuthDatasource>(
        () => _i17.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.SubjectRepo>(
        () => _i19.SubjectRepoImpl(gh<_i8.SubjectDataSource>()));
    gh.factory<_i20.GetAllExamsUsecase>(
        () => _i20.GetAllExamsUsecase(gh<_i18.SubjectRepo>()));
    gh.factory<_i21.ChangePasswordUsecase>(
        () => _i21.ChangePasswordUsecase(gh<_i12.ProfileRepo>()));
    gh.factory<_i22.ExamOnSubjectRepo>(
        () => _i23.ExamOnSubjectRepoImpl(gh<_i10.ExamsOnSubjectsDatasource>()));
    gh.factory<_i24.ExploreViewModelCubit>(
        () => _i24.ExploreViewModelCubit(gh<_i20.GetAllExamsUsecase>()));
    gh.factory<_i25.QuestionOnexamRepo>(
        () => _i26.QuestionOnexamRepoImpl(gh<_i14.QuestionOnExamDatasource>()));
    gh.factory<_i27.QuestionOnexamUsecase>(
        () => _i27.QuestionOnexamUsecase(gh<_i25.QuestionOnexamRepo>()));
    gh.factory<_i28.QuestionRepo>(
        () => _i29.QuestionRepoImpl(gh<_i6.QuestionDatasource>()));
    gh.factory<_i30.EditProfileUsecase>(
        () => _i30.EditProfileUsecase(gh<_i12.ProfileRepo>()));
    gh.factory<_i31.ProfileInfoUsecase>(
        () => _i31.ProfileInfoUsecase(gh<_i12.ProfileRepo>()));
    gh.factory<_i32.ExamOnsubjectUsecase>(
        () => _i32.ExamOnsubjectUsecase(gh<_i22.ExamOnSubjectRepo>()));
    gh.factory<_i33.CheckQuestionUsecase>(
        () => _i33.CheckQuestionUsecase(gh<_i28.QuestionRepo>()));
    gh.factory<_i34.Question0nexamCubit>(
        () => _i34.Question0nexamCubit(gh<_i27.QuestionOnexamUsecase>()));
    gh.factory<_i35.AuthRepo>(
        () => _i36.AuthRepoImpl(gh<_i16.AuthDatasource>()));
    gh.factory<_i37.EditProfileViewModelCubit>(
        () => _i37.EditProfileViewModelCubit(gh<_i30.EditProfileUsecase>()));
    gh.factory<_i38.LoginUseCase>(() => _i38.LoginUseCase(gh<_i35.AuthRepo>()));
    gh.factory<_i39.VerifyUsecase>(
        () => _i39.VerifyUsecase(gh<_i35.AuthRepo>()));
    gh.factory<_i40.ForgetPasswordUsecase>(
        () => _i40.ForgetPasswordUsecase(gh<_i35.AuthRepo>()));
    gh.factory<_i41.VerificationViewModelCubit>(
        () => _i41.VerificationViewModelCubit(gh<_i39.VerifyUsecase>()));
    gh.factory<_i42.SignupUsecase>(
        () => _i42.SignupUsecase(gh<_i35.AuthRepo>()));
    gh.factory<_i43.SignupViewModelCubit>(
        () => _i43.SignupViewModelCubit(gh<_i42.SignupUsecase>()));
    gh.factory<_i44.SubjectOnExamCubit>(
        () => _i44.SubjectOnExamCubit(gh<_i32.ExamOnsubjectUsecase>()));
    gh.factory<_i45.ResetPasswordUsecase>(
        () => _i45.ResetPasswordUsecase(gh<_i35.AuthRepo>()));
    gh.factory<_i46.LoginViewModelCubit>(
        () => _i46.LoginViewModelCubit(gh<_i38.LoginUseCase>()));
    gh.factory<_i47.ForgetPasswordViewModelCubit>(() =>
        _i47.ForgetPasswordViewModelCubit(gh<_i40.ForgetPasswordUsecase>()));
    gh.factory<_i48.ResetPasswordViewModelCubit>(() =>
        _i48.ResetPasswordViewModelCubit(gh<_i45.ResetPasswordUsecase>()));
    return this;
  }
}
