import 'package:flutter_dynamic_links/model/api_response_model.dart';
import 'package:flutter_dynamic_links/model/post_model.dart';
import 'package:flutter_dynamic_links/network/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxList<PostModel> postList = <PostModel>[].obs;

  @override
  void onInit() {
    _getPostList();
    super.onInit();
  }

  Future<void> _getPostList() async {
    ApiResponseModel result = await ApiService.instance.getPostList();
    if (result.error) {
      errorMessage(result.message!);
      isError(result.error);
      isLoading(false);
    } else {
      postList.addAll(result.data);
      isLoading(false);
    }
  }
}
