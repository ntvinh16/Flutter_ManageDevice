import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front_end_mobile_20240117/flavor/flavor_config.dart';
import 'package:front_end_mobile_20240117/routes/app.dart';
import 'package:front_end_mobile_20240117/routes/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Config flavor prod
  AppConfig.create(
    appName: "Prod Flavor Example",
    baseUrl: "http://localhost:3000",
    primaryColor: Colors.yellow,
    flavor: Flavor.PROD,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        // Call this method here to hide soft keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        initialRoute: AppRoutes.SIGNUP_PAGE,
        getPages: AppPages.routes,
      )
    );
  }
}
