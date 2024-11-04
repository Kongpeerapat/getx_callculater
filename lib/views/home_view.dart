import 'package:flutter/material.dart';
import 'package:getx_test/views/counter_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => CounterView());
            },
            child: Text("Go to callculater")),
      ),
    );
  }
}
