import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/datasource_contract/verify_datasource.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';
import 'package:online_exam/domain/repo_contract/verify_repo.dart';

class VerifyRepoImpl extends VerifyRepo{
  @factoryMethod
  VerifyDatasource apiDatasource;
  VerifyRepoImpl(this.apiDatasource);


  @override
  Future<Either<VerifyResponseEntity, String>> Verify({required String resetCode}) async{
    var response=await apiDatasource.Verify(resetCode: resetCode);
    return response.fold(
          (response) {
            VerifyResponseEntity verifyResponseEntity=response.toVerifyResponseEntity();
        return left(verifyResponseEntity);
      },
          (err) => right(err),

    );

  }


}