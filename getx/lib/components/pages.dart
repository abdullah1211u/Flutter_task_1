import 'package:get/get.dart';
import 'package:getx/components/routes.dart';
import 'package:getx/pages/first.dart';
import 'package:getx/pages/second.dart';
import 'package:getx/pages/unknown/unknown_view.dart';

class Pages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.home,
      page: () => const FirstPage(),
      
    ),
    GetPage(
      name: Routes.secondScreen,
      page: () => const SecondPage(),
      
    ),
  ];
  static final GetPage<dynamic> unknownScreenPageRoute = GetPage(
    name: Routes.unknownScreen,
    page: () => const UnknownScreen(),
  );
}
