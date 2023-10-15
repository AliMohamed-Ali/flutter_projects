import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/home_controller.dart';
import 'package:test_app/locale/locale_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    MyLocaleController localeLang = Get.find();
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Text("1".tr)),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Column(
          children: [
            // view file
            GetX<Controller>(
              builder: (controller) {
                print("count 1 rebuild");
                return Text('${controller.count1.value}');
              },
            ),
            GetX<Controller>(
              builder: (controller) {
                print("count 2 rebuild");
                return Text('${controller.count2.value}');
              },
            ),
            GetX<Controller>(
              builder: (controller) {
                print("count 3 rebuild");
                return Text('${controller.sum}');
              },
            ),
            Center(
              child: ElevatedButton(
                child: Text("2".tr),
                onPressed: () => localeLang.changeLang("ar"),
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text("3".tr),
                onPressed: () => localeLang.changeLang("en"),
              ),
            ),
          ],
        ),
        //
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => localeLang.changeLang("ar")));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.sum}")));
  }
}
