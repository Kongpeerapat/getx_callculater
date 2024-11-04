import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/counter_cotroller.dart';

class CounterView extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${counterController.num1}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Obx(
              () => Text(
                '${counterController.num2}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Obx(
              () => Text(
                '${counterController.sum}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 30),
            buildNumberRow([1, 2, 3]),
            SizedBox(height: 10),
            buildNumberRow([4, 5, 6]),
            SizedBox(height: 10),
            buildNumberRow([7, 8, 9]),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildActionButton('/', Colors.orange,
                    () => counterController.addToDivide()), // ปุ่มสำหรับการหาร
                buildNumberButton(0),
                buildActionButton('=', Colors.green,
                    () => counterController.calculateResult()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildActionButton(
                    '+', Colors.red, () => counterController.addToplus()),
                buildActionButton(
                    '*', Colors.blue, () => counterController.addToMultiply()),
                buildActionButton(
                    '-', Colors.blue, () => counterController.addTodelet()),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildActionButton(
                  "clear",
                  const Color.fromARGB(255, 123, 123, 123),
                  () => counterController.clearSum(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumberRow(List<int> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: numbers.map((number) => buildNumberButton(number)).toList(),
    );
  }

  Widget buildNumberButton(int number) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.amber,
      ),
      child: TextButton(
        onPressed: () => counterController.addToSum(number),
        child: Text(
          "$number",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Widget buildActionButton(String text, Color color, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
