part of 'biometric_auth_cubit.dart';

@immutable
abstract class BiometricAuthState {}

class BiometricAuthInitial extends BiometricAuthState {}


class onBioAuthLoading extends BiometricAuthState {}
class onBioAuthSuccess extends BiometricAuthState {}
class onBioAuthFail extends BiometricAuthState {
  String err;
  onBioAuthFail({required this.err});

}


