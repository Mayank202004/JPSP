import 'package:jpss/core/network/token_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = TokenService.accessToken;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        final isAccessTokenExpired = e.response?.statusCode == 401;
        final isRefreshingCall = e.requestOptions.path.contains("/users/refresh-token");

        if (isAccessTokenExpired && !isRefreshingCall) {
          final refreshSuccess = await _refreshAccessToken();

          if (refreshSuccess) {
            final newToken = TokenService.accessToken;

            // Clone the failed request and retry
            final clonedRequest = e.requestOptions;
            clonedRequest.headers['Authorization'] = 'Bearer $newToken';

            final response = await _dio.fetch(clonedRequest);
            return handler.resolve(response);
          } else {
            // Refresh failed – logout user
            TokenService.clearTokens();
            // Optional: redirect to login page here
            return handler.reject(e);
          }
        }

        return handler.next(e);
      },
    ));
  }

  Dio get client => _dio;

  Future<bool> _refreshAccessToken() async {
    try {
      final refreshToken = TokenService.refreshToken;

      if (refreshToken == null) return false;

      final response = await _dio.post(
        "${dotenv.env["BACKEND_URL"]}/users/refresh-token",
        data: {'refreshToken': refreshToken},
      );

      // Extract tokens from the 'data' field in the response
      final newAccess = response.data['data']['accessToken'];
      final newRefresh = response.data['data']['refreshToken'];

      // Save updated tokens
      TokenService.saveTokens(newAccess, newRefresh);

      return true;
    } catch (e) {
      print('Failed to refresh token: $e');
      return false;
    }
  }
}
