import 'package:chatapp/chat_screen.dart';
import 'package:chatapp/cubit/my_message_cubit.dart';
import 'package:chatapp/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './globals.dart';
import 'cubit/theme_cubit.dart';
import 'cubit/theme_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyMessageCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.ttt,
            home: SafeArea(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<ThemeCubit>(context).changeTheme();
                        },
                        icon: Icon(state.id),
                      )
                    ],
                    title: Text("ChatApp"),
                    bottom: TabBar(
                      tabs: [
                        Tab(
                          child: User(user:"Sender",count:senderCount),
                        ),
                        Tab(
                          child: User(user:"Receiver",count:receiverCount),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(children: [
                    ChatScreen(act: true),
                    ChatScreen(act: false),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class User extends StatelessWidget {
  
  String user;
  int count;
  User({required this.user, required this.count});

  @override
  Widget build(BuildContext context) {
    String cou=count.toString();
    String check=count==0?"":"($cou)";
    return Text(
     user + "$check",
    );
  }
}
