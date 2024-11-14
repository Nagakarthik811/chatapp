import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  //const Message({ Key? key }) : super(key: key);
  final String message;
  final bool action;
  Message({required this.message, required this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:action==true?Alignment.topRight:Alignment.topLeft,
      margin:EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      child: Card(
        color:action==true?Colors.green:Colors.blue,
        child:Padding(
          padding:EdgeInsets.all(5),
          child: Text(message)),
      ),
    );
  }
}
