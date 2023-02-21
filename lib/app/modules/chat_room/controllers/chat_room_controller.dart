import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatRoomController extends GetxController {
  TextEditingController chatTextController = TextEditingController();

  late IO.Socket socket;

  late String username;
  @override
  void onInit() {
    username = Get.arguments;
    initSocket();
    super.onInit();
  }

  initSocket() {
    socket = IO.io(ApiEndPoints().kBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    // socket.onDisconnect((_) => print('Connection Disconnected'));
    // socket.onConnectError((err) => print(err));
    // socket.onError((err) => print(err));
  }

  void sendMessage() {
    print(chatTextController.value.text);
    chatTextController.value.text;
  }
}
