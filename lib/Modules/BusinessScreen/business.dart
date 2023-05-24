import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/News_App/Cubit/cubit.dart';
import 'package:newsapp/Layout/News_App/Cubit/states.dart';


import '../../Shared/Components/Component.dart';



class Business extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list=NewsAppCubit.get(context).business;

        return list.length==0? Center(
          child: CircularProgressIndicator()):
        articleBuilder(list,context);
      },
    );
  }
}
