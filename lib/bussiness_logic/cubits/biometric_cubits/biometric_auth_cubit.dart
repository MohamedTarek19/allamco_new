import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

part 'biometric_auth_state.dart';

class BiometricAuthCubit extends Cubit<BiometricAuthState> {
  BiometricAuthCubit() : super(BiometricAuthInitial());

  late LocalAuthentication _localAuthentication;
  bool isAuthenticated = false;
  bool canAuthenticate = false;

  Future<bool> canAuth() async {
    //initialize the Local Authentication plugin
    _localAuthentication = LocalAuthentication();
    //check if device supports biometrics authentication.
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    canAuthenticate = isBiometricSupported && canCheckBiometrics;
    return canAuthenticate;
  }

  Future<List<BiometricType>> listAvailableBiometrics() async {
    return await _localAuthentication.getAvailableBiometrics();
  }

  Future<bool> authenticate() async {
    try {
      emit(onBioAuthLoading());
      if (await canAuth()) {
        List<BiometricType> types = await listAvailableBiometrics();
        print(types);

        isAuthenticated = await _localAuthentication.authenticate(
            authMessages: const [
              AndroidAuthMessages(
                signInTitle: 'Biometric authentication required!',
                cancelButton: 'No thanks.',
                biometricSuccess: 'Authenticated Successfully!!'
              ),
              IOSAuthMessages()
            ],
            localizedReason: 'To continue, you must complete the biometrics',
            options: const AuthenticationOptions(
              biometricOnly: false,
              stickyAuth: true,
              useErrorDialogs: true,
            ));
      }
      if (isAuthenticated) {
        emit(onBioAuthSuccess());
      } else {
        emit(onBioAuthFail(err: 'failed'));
      }
    } on PlatformException catch (e) {
      emit(onBioAuthFail(err: e.code));
    }
    return isAuthenticated;
  }
}
