import 'package:dio/dio.dart';
import 'package:quiz/core/utils/constans.dart';

class Api {
  Dio dio;
  Api(this.dio);
  Future<Map<String, dynamic>> post(
      {required String endPodint,
      required String email,
      required String password}) async {
    Response response = await dio.post('${Constans.paseUrlPost}$endPodint',
        data: {'email': email, 'password': password});

    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('${Constans.paseUrlGet}$endPoint');
    return response.data;
  }
}
