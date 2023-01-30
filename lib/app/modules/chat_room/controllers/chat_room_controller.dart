import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatRoomController extends GetxController {
  late IO.Socket socket;
  TextEditingController chatTextController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket']
    });
    socket.on('message', (data) => print(data));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
