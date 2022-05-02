import 'package:dio/dio.dart';
import 'package:flutter_dynamic_links/model/post_model.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: 20).inMilliseconds,
      connectTimeout: const Duration(seconds: 20).inMilliseconds,
      contentType: 'application/json',
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('posts')
  Future<List<PostModel>> getPosts();
}
