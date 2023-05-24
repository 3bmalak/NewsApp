import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/Search/search_screen.dart';
import '../../Shared/Components/Component.dart';
import '../../Shared/Network/Remote/Dio_Helper.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';
import 'CubitDarkmode/cubit.dart';



class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener:(context, state) {

      } ,
      builder: (context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
              cubit.appbar[cubit.ScreenIndex]
          ),
          actions: [
            IconButton(
              onPressed: ()
              {
                navigatorTo(context, Search());
            },
              icon: Icon(Icons.search),
            ),

            IconButton(
              onPressed: ()
            {
              AppCubit.get(context).ChangeThemeMode();
            },
              icon: Icon(Icons.brightness_4_rounded),
            ),

              IconButton(
                onPressed: ()
               {
                 cubit.GetSettings();
                },
                icon: Icon(Icons.settings),),
          ],
        ),
        body: cubit.Screen[cubit.ScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            cubit.ChangeNavBarIndex(index: value);
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.Index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label:'Business' ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label:'Sports' ),
            BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.settings),
            //     label: 'settings'),
          ],
        ),

      );
      } ,
    );
  }
}
