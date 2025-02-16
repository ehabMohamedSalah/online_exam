import 'package:dartz/dartz.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

abstract class VerifyRepo {
  Future<Either<VerifyResponseEntity, String>> Verify({required String resetCode});
}