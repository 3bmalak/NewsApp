
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../../Shared/Network/local/cache_Helper.dart';
import 'state.dart';


class AppCubit extends Cubit<ProjectStates>
{
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;

  void ChangeThemeMode({
  bool? fromShared
})
  {
    if(fromShared != null)
      {isDark=fromShared;}
    else
      {isDark=!isDark;}
    CacheHelper.Putbool(key: 'isDark', value: isDark).then((value) {
      emit(ChangeModeThemeState());
    }).catchError((onError){print('Error!!!!! ${onError.toString()}');});
    // emit(ChangeModeThemeState());

  }

}
