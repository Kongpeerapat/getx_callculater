import 'package:get/get.dart';

class CounterController extends GetxController {
  var num1 = 0.obs;
  var num2 = 0.obs;
  var sum = 0.obs;
  var isAddingSecondNumber = false.obs;
  var operation = ''.obs; // Track current operation (+, *, /)

  // เพิ่มค่าลงใน num1 หรือ num2
  void addToSum(int value) {
    if (isAddingSecondNumber.value) {
      num2.value = num2.value * 10 + value;
    } else {
      num1.value = num1.value * 10 + value;
    }
  }

  // ตั้งค่าการบวก
  void addToplus() {
    isAddingSecondNumber.value = true;
    operation.value = '+'; // กำหนด operation เป็นการบวก
  }

  // ตั้งค่าการลบ
  void addTodelet() {
    isAddingSecondNumber.value = true;
    operation.value = '-';
  }

  // ตั้งค่าการคูณ
  void addToMultiply() {
    isAddingSecondNumber.value = true;
    operation.value = '*'; // กำหนด operation เป็นการคูณ
  }

  // ตั้งค่าการหาร
  void addToDivide() {
    isAddingSecondNumber.value = true;
    operation.value = '/'; // กำหนด operation เป็นการหาร
  }

  // คำนวณผลลัพธ์ตาม operation ที่เลือก
  void calculateResult() {
    switch (operation.value) {
      case '+':
        sum.value = num1.value + num2.value;
        break;
      case '-':
        sum.value = num1.value - num2.value;
        break;
      case '*':
        sum.value = num1.value * num2.value;
        break;
      case '/':
        if (num2.value != 0) {
          sum.value =
              num1.value ~/ num2.value; // ใช้ ~/ สำหรับการหารแบบปัดเศษจำนวนเต็ม
        } else {
          sum.value = 0; // ป้องกันการหารด้วยศูนย์
        }
        break;
      default:
        sum.value = 0;
    }
  }

  // ล้างข้อมูลทั้งหมด
  void clearSum() {
    num1.value = 0;
    num2.value = 0;
    sum.value = 0;
    isAddingSecondNumber.value = false;
    operation.value = ''; // ล้าง operation
  }
}
