import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/News_App/Cubit/cubit.dart';
import 'package:newsapp/Layout/News_App/Cubit/states.dart';
import '../../Shared/Components/Component.dart';



class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=NewsAppCubit.get(context);

        return Scaffold(

          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Row(
                children: [
                Text(' Dark Mode',
                style: Theme.of(context).textTheme.bodyText1,

                ),
                  DefaultButton(text: 'off', function: ()
                  {
                    cubit.ChangeThemeMode();
                  },
                    width: 20.0
                  )


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
