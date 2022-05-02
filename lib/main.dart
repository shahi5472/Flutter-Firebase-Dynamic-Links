import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_links/controller/home_controller.dart';
import 'package:flutter_dynamic_links/model/post_model.dart';
import 'package:flutter_dynamic_links/widgets/error_view.dart';
import 'package:flutter_dynamic_links/widgets/item_view.dart';
import 'package:flutter_dynamic_links/widgets/loading.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Dynamic Links',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeController>(HomeController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('Flutter Firebase Dynamic Links')),
        body: controller.isLoading.value
            ? const Loading()
            : controller.isError.value
                ? ErrorView(text: controller.errorMessage.value.toString())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      PostModel model = controller.postList[index];
                      return ItemView(
                        index: index,
                        title: model.title.toString(),
                        subTitle: model.body.toString(),
                      );
                    },
                  ),
      ),
    );
  }
}
