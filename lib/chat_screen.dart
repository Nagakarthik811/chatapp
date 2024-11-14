import 'package:chatapp/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './globals.dart';
import './cubit/my_message_cubit.dart';
import './cubit/my_message_state.dart';
class ChatScreen extends StatelessWidget {
  //const ChatScreen({ Key? key }) : super(key: key);
  final bool act;
  ChatScreen({required this.act});

  @override
  Widget build(BuildContext context) {
      if(act==true)
      {
        sender=true;
        receiver=false;
      }
      else 
      {
        sender=false;
        receiver=true;
      }
    //List<ChatData> getData = getChatData;
    TextEditingController mycontroller = TextEditingController();
    return Column(
      children: [
        Expanded(
          flex: 21,
          child: BlocBuilder<MyMessageCubit, MyMessageState>(
            builder: (context, state) {
              return ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Message(
                      message: state.data[index].message,
                      action: act==state.data[index].status?true:false);
                },
                itemCount: state.data.length,
                shrinkWrap: true,
              );
            },
          ),
        ),
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            // physics:NeverScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: SizedBox(
                      width: 250,
                      //height:200,
                      child: TextField(
                        controller: mycontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Type your message",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 4),
                      child: CircleAvatar(
                        radius: 60,
                        child: IconButton(
                          onPressed: () {
                            bool sta=act==true?true:false;
                            act==true?receiverCount++:senderCount++;
                            BlocProvider.of<MyMessageCubit>(context)
                                .AddMessage(mycontroller.text,sta);
                             mycontroller.text="";
                          },
                          icon: Icon(Icons.send),
                          iconSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
