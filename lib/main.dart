import 'package:flutter/material.dart';
import 'screens/fakelogin.dart';
import 'screens/nav.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/premiumbanner.dart';
import 'screens/articles_controller.dart';
import 'screens/courses.dart';
import 'screens/my_courses/card_view_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check and insert default articles here
  await SQLHelper.checkAndInsertDefaultArticles();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom nav bar',
      home: LoginPage(),
      initialBinding: PremiumMembershipBinding(),
    );
  }

}

class PremiumMembershipBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PremiumMembershipController());
  }
}

