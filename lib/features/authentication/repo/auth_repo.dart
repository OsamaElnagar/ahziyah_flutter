import 'package:dio/dio.dart';
import 'package:ahziyah_flutter/features/authentication/model/user_response.dart';
import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:ahziyah_flutter/utils/app_constants.dart';
import '../service/user_hive_service.dart';

class AuthRepo {
  final DioClient dioClient;
  final UserHiveService userHiveService;

  AuthRepo({
    required this.dioClient,
    required this.userHiveService,
  });

  Future<Response> login(
    body,
  ) async {
    return await dioClient.postData(
      AppConstants.login,
      body,
    );
  }

  Future<Response?> logout() async {
    return await dioClient.postData(AppConstants.logout, {});
  }

  Future<Response> register(
      Map<String, String> body, List<MultipartBody> multipartBody) async {
    return await dioClient.postMultipartData(
      uri: AppConstants.register,
      fields: body,
      files: multipartBody,
    );
  }

  void updateToken(String token) {
    dioClient.token = token;
    dioClient.updateHeader(token: token);
  }

  bool isLoggedIn() {
    return getUserResponse()?.token.isNotEmpty ?? false;
  }

  Future<UserResponse> saveUserResponse(UserResponse userResponse) async {
    return userHiveService.saveUser(userResponse);
  }

  UserResponse? getUserResponse() {
    return userHiveService.getUser();
  }

  Future<void> clearUserResponse() async {
    await userHiveService.clearUser();
  }

  Future<Response> updateFCMToken(String fcmToken) async {
    return await dioClient.postData(
      'device/token',
      {
        'fcm_token': fcmToken,
        'device_type': 'flutter',
      },
    );
  }
}
