import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/pages/init_controller.dart';

class InitPages extends StatelessWidget {
  InitPages({Key? key}) : super(key: key);
  InitController initController = Get.put(InitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.teal,
                child: InkWell(
                  onTap: () => initController.executeMessageServer(),
                  child: const Center(
                    child: Text('Send Message Server'),
                  ),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   margin: const EdgeInsets.all(20),
              //   color: Colors.orange,
              //   child: InkWell(
              //     onTap: () => initController.executeDisconnect(),
              //     child: const Center(
              //       child: Text('Disconnect Socket'),
              //     ),
              //   ),
              // ),
            ]
        ),
    );
  }
}
