import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constant.dart';

@singleton
class ApiManager{
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: Constant.baseUrl,
          validateStatus: (status){
            if(status!<500){
              return true;
            }
            return false;
          }
      ),);
  }
  Future< Response > getRequest({ required String Endpoint,  Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers})async{
    var response=await dio.get( Endpoint,queryParameters: queryParameters,options: Options(
      headers: headers,
    ));
    return response;
  }

  Future<Response> postRequest({required String endpoint,Map<String, dynamic>? body,Map<String, dynamic>? headers})async{
    var response= await dio.post( endpoint, data: body,options: Options(
        headers: headers
    ));
    log(response.statusCode.toString());
    return  response;
  }

  Future< Response > put({ required String Endpoint,  Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers})async{
    var response=await dio.put( Endpoint,queryParameters: queryParameters,options: Options(
      headers: headers,
    ));
    return response;
  }

  Future< Response > delete({ required String Endpoint,  Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers})async{
    var response=await dio.delete( Endpoint,queryParameters: queryParameters,options: Options(
      headers: headers,
    ));
    return response;
  }

}