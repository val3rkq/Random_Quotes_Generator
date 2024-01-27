import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DataRepository {
  final String? mainUrl = dotenv.env['BASE_URL'];
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> getData() async {
    if (mainUrl == null) return null;

    Response response = await _dio.get(mainUrl!);
    return response.data;
  }
}
