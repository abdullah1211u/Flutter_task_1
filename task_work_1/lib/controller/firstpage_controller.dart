import 'package:get/get.dart';

class FirstPageController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }
}
