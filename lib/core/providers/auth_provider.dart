import 'package:betweener_app/app/app_preferences.dart';
import 'package:betweener_app/core/models/auth_model.dart';
import 'package:betweener_app/core/repository/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '../../app/locator.dart';
import '../../app/router/navigation_service.dart';
import '../../app/router/route_constants.dart';

class AuthProvider extends ChangeNotifier {
  AuthResponse? authResponse;
  late AuthRepository _authRepository;

  String errorMessage = "";

  bool isLoading = false;
  AuthProvider() {
    _authRepository = locator<AuthRepository>();
    getLocation();
  }

  double latitude = 0;
  double longitude = 0;

  void getLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }

  login({
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      await _authRepository.login(
        email: email,
        password: password,
        onSuccess: (response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200) {
            authResponse = AuthResponse.fromJson(response.data);
            debugPrint(authResponse.toString());
            isLoading = false;
            notifyListeners();
            locator<AppPreferences>().setUserLoggedIn();
            locator<AppPreferences>().setUser(authResponse!.user!);
            print(authResponse!.user!);
            locator<NavigationService>()
                .navigateToAndRemove(RouteConstants.home);
          } else {
            errorMessage = response.data['message'];
            isLoading = false;
            notifyListeners();
          }
          isLoading = false;
          notifyListeners();
        },
        onError: (err) {
          isLoading = false;
          errorMessage = err.message;
          notifyListeners();
        },
        onLoading: () {
          errorMessage = "";
          isLoading = true;
          notifyListeners();
        },
      );
    }
  }

  updateLocation() async {
    await _authRepository.updateLocation(
      id: authResponse!.user!.id!,
      lat: latitude,
      long: longitude,
      onSuccess: (res) {
        print(res.data);
      },
    );
  }

  register({
    required String email,
    required String name,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    await _authRepository.register(
      name: name,
      email: email,
      password: password,
      onSuccess: (response) {
        isLoading = false;
        notifyListeners();
        if (response.statusCode == 200) {
          authResponse = AuthResponse.fromJson(response.data);
          updateLocation();
          debugPrint(authResponse.toString());
          isLoading = false;
          notifyListeners();
          locator<AppPreferences>().setUserLoggedIn();
          locator<AppPreferences>().setUser(authResponse!.user!);
          // locator<NavigationService>().navigateToAndRemove(RouteConstants.home);
        } else {
          errorMessage = response.data['message'];
          isLoading = false;
          notifyListeners();
        }
        isLoading = false;
        notifyListeners();
      },
      onError: (err) {
        isLoading = false;
        errorMessage = err.message;
        notifyListeners();
      },
      onLoading: () {
        errorMessage = "";
        isLoading = true;
        notifyListeners();
      },
    );
  }
}
