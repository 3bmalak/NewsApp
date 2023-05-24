import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/News_App/Cubit/cubit.dart';
import 'package:newsapp/Layout/News_App/Cubit/states.dart';

import 'Layout/News_App/CubitDarkmode/cubit.dart';
import 'Layout/News_App/News_App.dart';
import 'Shared/Network/Remote/Dio_Helper.dart';
import 'Shared/Network/local/cache_Helper.dart';
import 'Shared/Style/Colors/Themes.dart';
import 'Shared/block_observer.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  var isDark = CacheHelper.getData(key: 'isDark');


  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  late bool isDark;
  late Widget startWidget;

  MyApp( this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

      BlocProvider(
        create: (context) => AppCubit()..ChangeThemeMode(
            fromShared: isDark
        ),),
      BlocProvider(
        create:(context) => NewsAppCubit()..getBusinessData() ,),
    ],
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context, state)
        {

        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: isDark ?ThemeMode.dark:ThemeMode.light,
            home: NewsApp() ,
          );
        },
      ),
    );
  }
}
