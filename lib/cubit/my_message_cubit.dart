import 'package:bloc/bloc.dart';
import 'package:chatapp/chat_data.dart';

import 'my_message_state.dart';

class MyMessageCubit extends Cubit<MyMessageState> {
  MyMessageCubit() : super(MyMessageState(data:getChatData));
  
  void AddMessage(String msg,bool sta)
  {
    if(msg.isEmpty)
    return ;
   state.data.add(ChatData(message: msg,status: sta));
    emit(MyMessageState(data:getChatData));
  }

}

