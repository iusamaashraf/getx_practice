import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_practice/pages/dairy_farm_listing.dart';
import 'package:getx_practice/pages/size_config.dart';
// import 'package:getx_practice/count.dart';
// import 'package:getx_practice/root/root_page.dart';

// import 'GetX_Management/getx_counter_page.dart';
//import 'package:getx_practice/obx_increment_merge_business_logic_and_ui.dart';
//import 'custom_class_get_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              theme: ThemeData(
                colorScheme: const ColorScheme.light(),
              ),
              //theme: ThemeData(fontFamily: 'Montserrat'),
              debugShowCheckedModeBanner: false,
              //  builder: DevicePreview.appBuilder,
              home: DairyFarmListing(),
            );
          },
        );
      },
    );
  }
}
// return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       //home: ObxIncrementInMergeBusinessLogicAndUI(),
//       // home: CustomClassGetData(),
//       // home: Counter(),
//       //home: RootPage(),
//       //home: GetXCounterPage(),
//       home: const DairyFarmListing(),
//     );