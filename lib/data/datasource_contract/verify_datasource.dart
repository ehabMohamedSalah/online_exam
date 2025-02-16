import 'package:dartz/dartz.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';

abstract class VerifyDatasource {
  Future<Either<VerifyResponse, String>> Verify({required String resetCode});
}
