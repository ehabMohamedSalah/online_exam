// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/auth_datasource.dart' as _i14;
import '../../data/datasource_contract/exams_onsubject_datasource.dart' as _i8;
import '../../data/datasource_contract/profile_datasource.dart' as _i4;
import '../../data/datasource_contract/question_onexam_datasource.dart' as _i12;
import '../../data/datasource_contract/subjects_datasource.dart' as _i6;
import '../../data/datasource_impl/auth_impl_datasource.dart' as _i15;
import '../../data/datasource_impl/exams_onsubject_datasource_impl.dart' as _i9;
import '../../data/datasource_impl/profile_impl_datasource.dart' as _i5;
import '../../data/datasource_impl/question_onexam_datasource_Impl.dart'
    as _i13;
import '../../data/datasource_impl/subject_impl_datasource.dart' as _i7;
import '../../data/repo_impl/auth_repo_impl.dart' as _i31;
import '../../data/repo_impl/exam_onsubject_repo_impl.dart' as _i21;
import '../../data/repo_impl/exams_repo_impl.dart' as _i17;
import '../../data/repo_impl/profile_repo_impl.dart' as _i11;
import '../../data/repo_impl/question_omexam_repo_impl.dart' as _i24;
import '../../domain/repo_contract/auth_repo.dart' as _i30;
import '../../domain/repo_contract/exam_onsubject_repo.dart' as _i20;
import '../../domain/repo_contract/profile_repo.dart' as _i10;
import '../../domain/repo_contract/question_onexam_repo.dart' as _i23;
import '../../domain/repo_contract/subject_repo.dart' as _i16;
import '../../domain/usecase/auth_usecase/forget_password_usecase.dart' as _i35;
import '../../domain/usecase/auth_usecase/login_usecase.dart' as _i33;
import '../../domain/usecase/auth_usecase/reset_password.dart' as _i40;
import '../../domain/usecase/auth_usecase/signup_usecase.dart' as _i37;
import '../../domain/usecase/auth_usecase/verify_usecase.dart' as _i34;
import '../../domain/usecase/exam_onsubject_usecase.dart' as _i28;
import '../../domain/usecase/get_all_exam_usecase.dart' as _i18;
import '../../domain/usecase/profile_usecase/change_password_usecase.dart'
    as _i19;
import '../../domain/usecase/profile_usecase/edit_profile_usecase.dart' as _i26;
import '../../domain/usecase/profile_usecase/profile_info_usecase.dart' as _i27;
import '../../domain/usecase/question_onexam_usecase.dart' as _i25;
import '../../presentation/auth/forget_password/forget_password/view_model/forget_password_view_model_cubit.dart'
    as _i42;
import '../../presentation/auth/forget_password/reset_password/view_model/reset_password_view_model_cubit.dart'
    as _i43;
import '../../presentation/auth/forget_password/verify_otp_code/view/view_model/verification_view_model_cubit.dart'
    as _i36;
import '../../presentation/auth/login/view_model/login_view_model_cubit.dart'
    as _i41;
import '../../presentation/auth/signUp/view_Model/signup_view_model_cubit.dart'
    as _i38;
import '../../presentation/home/tabs/explore_tab/quiz_screen/view_model/question0nexam_cubit.dart'
    as _i29;
import '../../presentation/home/tabs/explore_tab/subject_on_exams/view_model/subject_on_exam_cubit.dart'
    as _i39;
import '../../presentation/home/tabs/explore_tab/view_model/explore_view_model_cubit.dart'
    as _i22;
import '../../presentation/home/tabs/profile_tab/edit_profile_screen/view_model/edit_profile_view_model_cubit.dart'
    as _i32;
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
    gh.factory<_i6.SubjectDataSource>(
        () => _i7.SubjectDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.ExamsOnSubjectsDatasource>(
        () => _i9.ExamsOnSubjectsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.ProfileRepo>(
        () => _i11.ProfileRepoImpl(gh<_i4.ProfileDatasource>()));
    gh.factory<_i12.QuestionOnExamDatasource>(
        () => _i13.QuestionOnExamDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.AuthDatasource>(
        () => _i15.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.SubjectRepo>(
        () => _i17.SubjectRepoImpl(gh<_i6.SubjectDataSource>()));
    gh.factory<_i18.GetAllExamsUsecase>(
        () => _i18.GetAllExamsUsecase(gh<_i16.SubjectRepo>()));
    gh.factory<_i19.ChangePasswordUsecase>(
        () => _i19.ChangePasswordUsecase(gh<_i10.ProfileRepo>()));
    gh.factory<_i20.ExamOnSubjectRepo>(
        () => _i21.ExamOnSubjectRepoImpl(gh<_i8.ExamsOnSubjectsDatasource>()));
    gh.factory<_i22.ExploreViewModelCubit>(
        () => _i22.ExploreViewModelCubit(gh<_i18.GetAllExamsUsecase>()));
    gh.factory<_i23.QuestionOnexamRepo>(
        () => _i24.QuestionOnexamRepoImpl(gh<_i12.QuestionOnExamDatasource>()));
    gh.factory<_i25.QuestionOnexamUsecase>(
        () => _i25.QuestionOnexamUsecase(gh<_i23.QuestionOnexamRepo>()));
    gh.factory<_i26.EditProfileUsecase>(
        () => _i26.EditProfileUsecase(gh<_i10.ProfileRepo>()));
    gh.factory<_i27.ProfileInfoUsecase>(
        () => _i27.ProfileInfoUsecase(gh<_i10.ProfileRepo>()));
    gh.factory<_i28.ExamOnsubjectUsecase>(
        () => _i28.ExamOnsubjectUsecase(gh<_i20.ExamOnSubjectRepo>()));
    gh.factory<_i29.Question0nexamCubit>(
        () => _i29.Question0nexamCubit(gh<_i25.QuestionOnexamUsecase>()));
    gh.factory<_i30.AuthRepo>(
        () => _i31.AuthRepoImpl(gh<_i14.AuthDatasource>()));
    gh.factory<_i32.EditProfileViewModelCubit>(
        () => _i32.EditProfileViewModelCubit(gh<_i26.EditProfileUsecase>()));
    gh.factory<_i33.LoginUseCase>(() => _i33.LoginUseCase(gh<_i30.AuthRepo>()));
    gh.factory<_i34.VerifyUsecase>(
        () => _i34.VerifyUsecase(gh<_i30.AuthRepo>()));
    gh.factory<_i35.ForgetPasswordUsecase>(
        () => _i35.ForgetPasswordUsecase(gh<_i30.AuthRepo>()));
    gh.factory<_i36.VerificationViewModelCubit>(
        () => _i36.VerificationViewModelCubit(gh<_i34.VerifyUsecase>()));
    gh.factory<_i37.SignupUsecase>(
        () => _i37.SignupUsecase(gh<_i30.AuthRepo>()));
    gh.factory<_i38.SignupViewModelCubit>(
        () => _i38.SignupViewModelCubit(gh<_i37.SignupUsecase>()));
    gh.factory<_i39.SubjectOnExamCubit>(
        () => _i39.SubjectOnExamCubit(gh<_i28.ExamOnsubjectUsecase>()));
    gh.factory<_i40.ResetPasswordUsecase>(
        () => _i40.ResetPasswordUsecase(gh<_i30.AuthRepo>()));
    gh.factory<_i41.LoginViewModelCubit>(
        () => _i41.LoginViewModelCubit(gh<_i33.LoginUseCase>()));
    gh.factory<_i42.ForgetPasswordViewModelCubit>(() =>
        _i42.ForgetPasswordViewModelCubit(gh<_i35.ForgetPasswordUsecase>()));
    gh.factory<_i43.ResetPasswordViewModelCubit>(() =>
        _i43.ResetPasswordViewModelCubit(gh<_i40.ResetPasswordUsecase>()));
    return this;
  }
}
