import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


import 'package:studentapp/view/Screens/StudentInfromationCard.dart';
import 'package:studentapp/view/constant/routes/approutes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
 home: StudentInformationCard(),
      getPages: AppRoutes.routes,
    );
  }
}
