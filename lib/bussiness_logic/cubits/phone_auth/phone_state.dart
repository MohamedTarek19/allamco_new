part of 'phone_cubit.dart';

@immutable
abstract class PhoneState {}

class PhoneInitial extends PhoneState {}

class onSendOTPSuccess extends PhoneState {}

class onVerifyOTPSuccess extends PhoneState {}
class onVerifyOTPLoading extends PhoneState {}

class onVerifyOTPFail extends PhoneState {
  late String err;
  onVerifyOTPFail({required this.err});
}

class onSendOTPFail extends PhoneState {
  late String err;
  onSendOTPFail({required this.err});
}

class onSendOTPLoading extends PhoneState {}

class onOperationSuccess extends PhoneState {}
