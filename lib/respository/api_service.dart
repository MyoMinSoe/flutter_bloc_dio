import 'package:dio/dio.dart';
import 'package:flutter_bloc_with_dio/model/user.dart';

class ApiService {
  final Dio _dio = Dio()..options.baseUrl = 'http://dummyjson.com/';

  Future<UserModel?> fetchUserList(int skip) async {
    try {
      var response = await _dio.get(
        'users',
        queryParameters: {'skip': skip},
      );
      return UserModel.fromJson(response.data);
    } on DioException {
      return null;
    }
  }
}
