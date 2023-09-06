import 'dart:math';

import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class InitController extends GetxController {
  late Socket socket;
  final String messageFromServer = 'MESSAGE_FROM_SERVER';
  final String messageFromClient = 'MESSAGE_FROM_CLIENT';
  final String welcomeMessage = 'WELCOME_MESSAGE';

  @override
  void onInit() {
    super.onInit();
    initControllerAndSocket();
  }

  initControllerAndSocket() {
    try {
      // example: http://192.168.0.1:3000
      socket = io('http://your_ip_here:3000', // TODO: Change to your IP
          OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              // .disableAutoConnect()  // disable auto-connection
              // .setExtraHeaders({'foo': 'bar'}) // optional
              .build()
      );

      socket.onConnect((data) => print('Connected'));

      socket.on(welcomeMessage, (data) => print('ClientsUpdated :: $data'));
      socket.on(messageFromServer, (data) => print('MessageFromServer :: $data'));

      socket.onDisconnect((_) => print('disconnect'));
    } catch (e) {
      print('Error: $e');
    }
  }

  void executeMessageServer() {
    String text = generateTextRandom(10);
    socket.emit(messageFromClient, 'Hello from client flutter -> $text');
  }

  String generateTextRandom(int longitud) {
    const characters =
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    final buffer = StringBuffer();

    for (int i = 0; i < longitud; i++) {
      final indice = random.nextInt(characters.length);
      buffer.write(characters[indice]);
    }

    return buffer.toString();
  }

  void executeDisconnect() {
    // socket.disconnect();
  }
}