import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/entity/Auth/verify_response_entity/verify_response.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../domain/usecase/auth_usecase/verify_usecase.dart';

part 'verification_view_model_state.dart';

@injectable
class VerificationViewModelCubit extends Cubit<VerificationViewModelState> {
  VerifyUsecase verifyUsecase;
  @factoryMethod
  VerificationViewModelCubit(this.verifyUsecase) : super(VerificationInitial());
 static VerificationViewModelCubit get(context){
    return BlocProvider.of(context);
  }
  Future<void> Verify({required String resetCode})async{

    emit(VerficationLoading());
   var response =await verifyUsecase.call(resetCode: resetCode);
   if( response is SuccessApiResult<VerifyResponseEntity>){
     print("✅ Success: ${response.data?.message??"Right OTP"}");
     emit(VerificationSuccess(response));
   }else if(response is ErrorApiResult<VerifyResponseEntity>){
     print("❌ Error: ${response.exception}");
     emit(VerificationError(response));
   }
  }




}
