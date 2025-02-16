
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_manager.dart';
import 'package:online_exam/core/api/endpoints.dart';
import 'package:online_exam/data/datasource_contract/verify_datasource.dart';
import 'package:online_exam/data/model/Auth/verify_code/verify_response.dart';

@Injectable(as: VerifyDatasource)
class VerifyDatasourceImpl extends VerifyDatasource {
  @factoryMethod
  ApiManager apiManager;

  VerifyDatasourceImpl(this.apiManager);

  @override
  Future<Either<VerifyResponse, String>> Verify(
      {required String resetCode}) async {
    try {
      var response = await apiManager
          .postRequest(endpoint: EndPoint.verifyEndpoint, body: {
        "resetCode": resetCode,
      });
      VerifyResponse verifyResponse =VerifyResponse.fromJson(response.data) ;
      if(verifyResponse.code!=null)return right(verifyResponse.message??"");
      return left(verifyResponse);
    }catch(err){
      return right(err.toString());
    }





  }

}