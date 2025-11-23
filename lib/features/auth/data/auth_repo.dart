import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/utils/pref_helper.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();
  bool isGuest = false;
  UserModel? _currentUser;

  //Login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/login', {
        'email': email,
        'password': password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        if (code != 200 || data == null) {
          throw ApiError(message: msg);
        }
        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
        }
        isGuest = false;
        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExcepected error');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handlerError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //SignUp
  Future<UserModel?> signup({
    required String name,
    required String email,
    required String pass,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': pass,
      });

      final response = await apiService.post('/register', formData);
      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];

        final coder = int.tryParse(code.toString());
        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg);
        }
        final user = UserModel.fromJson(data);
        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
        }
        isGuest = false;
        _currentUser = user;
        return user;
      } else {
        throw ApiError(message: 'UnExcepected error');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handlerError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //getProfileData
  Future<UserModel?> getProfileData() async {
    try {
      final token = await PrefHelper.getToken();
      if (token == null || token == 'guest') {
        return null;
      }
      final response = await apiService.get('/profile');
      final user = UserModel.fromJson(response['data']);
      _currentUser = user;
      return user;
    } on DioException catch (e) {
      ApiExceptions.handlerError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //updateProfileData
  Future<UserModel?> updateProfile({
    required String name,
    required String email,
    required String address,
    String? visa,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'address': address,
        if (imagePath != null && imagePath.isNotEmpty)
          'image': await MultipartFile.fromFile(
            imagePath,
            filename: 'profile.jpg',
          ),
        if (visa != null && visa.isNotEmpty) 'Visa': visa,
      });
      final response = await apiService.post('/update-profile', formData);
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        if (code != 200 || code != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }
        final updatedUser = UserModel.fromJson(response['data']);
        _currentUser = updatedUser;
        return updatedUser;
      } else {
        throw ApiError(message: 'UnExcepected error');
      }
    } on DioException catch (e) {
      ApiExceptions.handlerError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
    return null;
  }

  //logout
  Future<void> logout() async {
    final response = await apiService.post('/logout', {});
    if (response['data'] != null) {
      throw ApiError(message: 'fjnvjkd');
    }
    await PrefHelper.clearToken();
    _currentUser = null;
    isGuest = true;
  }

  //auto login
  Future<UserModel?> autoLogin() async {
    final token = PrefHelper.getToken();
    if (token == null || token == 'guest') {
      isGuest = true;
      _currentUser = null;
      return null;
    }
    isGuest = false;
    try {
      final user = await getProfileData();
      _currentUser = user;
      return user;
    } catch (_) {
      await PrefHelper.clearToken();
      isGuest = true;
      _currentUser = null;
      return null;
    }
  }

  //continue as aguest
  Future<void> continueAsGuest() async {
    isGuest = true;
    _currentUser = null;
    await PrefHelper.saveToken('guest');
  }

  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => !isGuest && _currentUser != null;
}
