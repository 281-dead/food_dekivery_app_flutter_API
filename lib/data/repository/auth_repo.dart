import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hc_e_commerce_food_delivery/data/api/api_client.dart';
import 'package:hc_e_commerce_food_delivery/model/signup_body_model.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<dynamic> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  Future<dynamic> login(String phone, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, {"phone": phone, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  //Clear shared data in local storage
  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
