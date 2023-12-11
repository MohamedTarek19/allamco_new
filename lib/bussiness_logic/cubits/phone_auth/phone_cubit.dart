import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phone_state.dart';

class PhoneCubit extends Cubit<PhoneState> {
  PhoneCubit() : super(PhoneInitial());

  bool isverifing = false;

  final Auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> phoneAuthenticator(String phone) async {
    try{
      emit(onSendOTPLoading());
      await Auth.verifyPhoneNumber(
        timeout: const Duration(minutes: 2),
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          await Auth.signInWithCredential(phoneAuthCredential);
          emit(onOperationSuccess());
        },
        verificationFailed: (error) {
          print("error is : ${error.code}");
          emit(onSendOTPFail(err: error.code));
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId = verificationId;
          emit(onSendOTPSuccess());

        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId = verificationId;
        },
      );
    }catch(e){
      print("error is : $e");
    }

  }


  Future<bool> verifyOTP(String otp) async {
    try{
      isverifing = false;
      emit(onVerifyOTPLoading());
      var crid = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
      var crids = await Auth.signInWithCredential(crid);
      crids.user == null ? isverifing = false:isverifing = true;
      emit(onVerifyOTPSuccess());
      return true;
    }catch(e){
      emit(onVerifyOTPFail(err: "incorrect try again!!!!$e"));
      return false;
    }
  }
}
