import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/pages/init_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Websocket',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => InitPages()),
      ],

      // CAMBIANDO LOS COLORES POR DEFECTO DE LA APLICACION
      theme: ThemeData(
          primaryColor: Colors.orange,
          colorScheme: const ColorScheme(
            primary: Colors.orange,
            secondary: Colors.orange,
            brightness: Brightness.light,
            onBackground: Colors.grey,
            onPrimary: Colors.grey,
            surface: Colors.grey,
            onSurface: Colors.grey,
            background: Colors.grey,
            error: Colors.grey,
            onSecondary: Colors.grey,
            onError: Colors.grey,
          )
      ),
      navigatorKey: Get.key,
    );
  }
}