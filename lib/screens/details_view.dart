import 'package:flutter/material.dart';
import 'package:flutter_dynamic_links/controller/home_controller.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.id, this.data}) : super(key: key);

  final String id;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    controller.getPostDetails(id);
    return Scaffold(
      appBar: AppBar(title: Text('Details View Id $id')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details View Id $id',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            Text(
              'Data :: $data',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
