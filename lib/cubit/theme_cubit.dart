import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            ttt: ThemeData.light(),
            id: Icons.light_mode,
          ),
        );

    void changeTheme()
    {
      IconData temp;
      ThemeData? td;
      temp=state.id==Icons.light_mode?Icons.dark_mode:Icons.light_mode;
      td=state.ttt==ThemeData.light()?ThemeData.dark():ThemeData.light();

      emit(ThemeState(ttt: td,id:temp));
    }
}
