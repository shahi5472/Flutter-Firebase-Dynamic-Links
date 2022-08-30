import 'package:flutter_dynamic_links/controller/home_controller.dart';
import 'package:flutter_dynamic_links/model/post_model.dart';

import 'package:flutter_dynamic_links/widgets/error_view.dart';
import 'package:flutter_dynamic_links/widgets/item_view.dart';
import 'package:flutter_dynamic_links/widgets/loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeController>(HomeController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('Flutter Firebase Dynamic Links')),
        body: controller.isLoading.value
            ? const Loading()
            : controller.isError.value
                ? ErrorView(
                    text: controller.errorMessage.value.toString(),
                    onPressed: () => controller.retry(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      PostModel model = controller.postList[index];
                      return ItemView(
                        id: model.id!,
                        index: index,
                        title: model.title.toString(),
                        subTitle: model.body.toString(),
                        model: model,
                      );
                    },
                  ),
      ),
    );
  }
}
