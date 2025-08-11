import 'package:get/get.dart';
import 'package:getx/model/student.dart';

class SecondController extends GetxController {
NameScreenParams studentDetils=NameScreenParams(
    name: '',
    age: '',
    image: '',
    id: '',
  );

  void getScreenParams(){
    final args = Get.arguments;
    if(args is NameScreenParams){
      studentDetils = args;
      update(); // Update the controller to reflect the new data
    } else {
      studentDetils = NameScreenParams(
        name: 'Default Name',
        age: '0',
        image: 'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
        id: '0',
      );

    }
  }


  @override
  void onInit() {
    super.onInit();
    getScreenParams();
  }

}
