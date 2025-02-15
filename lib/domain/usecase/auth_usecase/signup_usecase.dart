import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entity/Auth/auth_response.dart';
import '../../repo_contract/auth_repo.dart';

@injectable
class SignupUsecase {
  AuthRepo authRepo;

  SignupUsecase(this.authRepo);

  Future<Either<AuthResponseEntity, String>> call({
    required  String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) {
    return authRepo.SignUp(username: username, firstName: firstName, lastName: lastName, email: email, password: password, rePassword: rePassword, phone: phone);
}}