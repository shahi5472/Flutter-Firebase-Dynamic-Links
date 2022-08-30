import 'package:flutter/material.dart';
import 'package:flutter_dynamic_links/model/api_response_model.dart';
import 'package:flutter_dynamic_links/model/post_model.dart';
import 'package:flutter_dynamic_links/network/api_service.dart';
import 'package:flutter_dynamic_links/screens/profile_view.dart';
import 'package:get/get.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_dynamic_links/screens/details_view.dart';

import '../model/dynamic_link_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxList<PostModel> postList = <PostModel>[].obs;

  Rx<PostModel> postModel = PostModel().obs;

  @override
  void onInit() {
    _getPostList();
    initDynamicLink();
    super.onInit();
  }

  Future<void> retry() async {
    _getPostList();
    isLoading(true);
    isError(false);
    errorMessage("");
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

  void initDynamicLink() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    await _handleDeepLink(data);

    FirebaseDynamicLinks.instance.onLink.listen((data) async {
      await _handleDeepLink(data);
    }).onError((error) {
      print("5 => Error Links => $error");
      Get.snackbar(
        "Error",
        "Error message => $error",
        icon: const Icon(Icons.link),
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  Future<void> _handleDeepLink(PendingDynamicLinkData? data) async {
    print("Data :: $data");

    if (data != null) {
      print("Data Link :: ${data.link.path}");
      final Uri uri = data.link;
      print("Uri :: $uri");
      final queryParams = uri.queryParameters;
      if (queryParams.isNotEmpty) {
        dynamic mapData = queryParams["data"];

        print("Type :: ${mapData.runtimeType}");
        print("Data :: $mapData");

        DynamicLinkModel dynamicLinkModel = dynamicLinkModelFromJson(mapData);
        print("+=======================================+");
        print("Map Id is :: ${dynamicLinkModel.id}");
        print("Map Route is :: ${dynamicLinkModel.route}");
        print("Map Route is :: ${dynamicLinkModel.api}");
        print("Map Route is :: ${dynamicLinkModel.image}");
        print("Map Route is :: ${dynamicLinkModel.pageType}");
        print("-=======================================-");

        Get.snackbar(
          "Id => ${dynamicLinkModel.id} :: Route => ${dynamicLinkModel.route}",
          "Links => ${data.link}",
          icon: const Icon(Icons.link),
          snackPosition: SnackPosition.BOTTOM,
        );

        if (dynamicLinkModel.route == 'profile') {
          Get.to(const ProfileView());
        } else {
          Get.to(DetailsView(id: '${dynamicLinkModel.id}', data: uri));
        }
      }
    }
  }

  Future<void> getPostDetails(String id) async {
    print('Given Id: $id');
  }
}
