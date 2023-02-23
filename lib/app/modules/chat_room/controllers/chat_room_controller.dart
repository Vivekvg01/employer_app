import 'package:employer_app/app/modules/employeeDetails/controllers/employee_details_controller.dart';
import 'package:employer_app/app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as iO;

class ChatRoomController extends GetxController {
  TextEditingController chatTextController = TextEditingController();

  late iO.Socket socket;

  String? employeeId;

  RxList messageList = [].obs;

  late String username;
  @override
  void onInit() {
    username = Get.arguments;
    initSocket();
    socket.on('new-room-created', (room) {
      messageList.add(room);
    });
    super.onInit();
  }

  initSocket() {
    socket = iO.io(ApiEndPoints().kBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
     // print('Connection established');
    });
  }

  sendMessage() {
    String message = chatTextController.text.trim();
    if (message.isEmpty) return;
    Map messageMap = {
      'message': message,
      'senderId': Get.find<EmployeeDetailsController>().employerId,
      'receiverId': employeeId,
      'time': DateTime.now().millisecondsSinceEpoch,
    };
    socket.emit('sendNewMessage', messageMap);
  }
}
