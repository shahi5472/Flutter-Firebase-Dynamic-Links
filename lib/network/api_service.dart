import 'package:flutter_dynamic_links/model/api_response_model.dart';
import 'package:flutter_dynamic_links/model/post_model.dart';
import 'package:flutter_dynamic_links/network/core/net_connect.dart';

class ApiService extends NetConnect {
  static ApiService get instance => ApiService();

  Future<ApiResponseModel> getPostList() async {
    return await apiClient.getPosts().then((value) {
      return ApiResponseModel<List<PostModel>>(error: false, data: value);
    }).onError((error, stackTrace) {
      return ApiResponseModel(
        error: true,
        message: 'Error',
      );
    });
  }
}
