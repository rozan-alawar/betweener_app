import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> authanticate() async {
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(biometricOnly: true));
    return _auth.authenticate(
      localizedReason: 'Scan  your fingerprint to authenticate',
      // biometricOnly: true,
      // useErrorDialogs: true,
      // stickyAuth: true,
    );
  }
}
