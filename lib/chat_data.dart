import 'package:flutter/material.dart';
class ChatData {
  final String message;
  final bool status;
  
  ChatData({
    required this.message,
    required this.status,
  });

}
List<ChatData> chatList=[
    ChatData(
      message: "Hii receiver",
      status:true
    ),
    ChatData(
      message: "Hii sender",
      status:false
    ),
  ];
List<ChatData> get getChatData
  {

    return chatList;
  }

