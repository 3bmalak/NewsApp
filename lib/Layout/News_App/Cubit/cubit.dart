
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/BusinessScreen/business.dart';
import 'package:newsapp/Modules/ScienceScreen/science.dart';
import 'package:newsapp/Modules/SettingScreen/settings.dart';
import 'package:newsapp/Modules/SportsScreen/sports.dart';
import '../../../Shared/Network/Remote/Dio_Helper.dart';
import 'states.dart';



class NewsAppCubit extends Cubit<NewsAppStates>{
  NewsAppCubit() : super(NewsInitState());
  static NewsAppCubit get(context) => BlocProvider.of(context);

  int Index=0;
  int ScreenIndex=0;

  List<Widget> Screen=[
    Business(),
    Sports(),
    Science(),
    Settings()
  ];
  List<String> appbar = [
    'Business',
    'Sports',
    'Science',
    'Settings'
  ];

  void ChangeNavBarIndex({required int index})
  {
    Index=index;
    ScreenIndex=index;
    if(ScreenIndex==2)
      getScienceData();
    if(ScreenIndex==1)
      getSportsData();
    emit(NewsBottomNavState());
  }


  List<dynamic> business=[];
  void getBusinessData()
  {
    emit(NewsLoadingBusinessState());
    DioHelper.getData(url: 'v2/top-headlines',query: {
      'country':'eg',
      'category':'business',
      'apiKey':'2c20ec06960b42aea81887dddcc57e0c'
    })
        .then((value) {

     business= value.data['articles'];
     print(business.length);
     emit(NewsGetBusinessState());
    }).catchError((Error){
      print('errooooor ${Error.toString()}');});
    emit(NewsGetBusinessState());
  }

  List<dynamic> sports=[];
  void getSportsData()
  {
    emit(NewsLoadingSportState());
    DioHelper.getData(url: 'v2/top-headlines',query: {
      'country':'eg',
      'category':'Sports',
      'apiKey':'2c20ec06960b42aea81887dddcc57e0c'
    })
        .then((value) {

      sports= value.data['articles'];

     emit(NewsGetSportState());
    }).catchError((Error){
      print('errooooor ${Error.toString()}');});
    emit(NewsGetSportState());
  }

  List<dynamic> science=[];
  void getScienceData()
  {
    emit(NewsLoadingScienceState());
    DioHelper.getData(url: 'v2/top-headlines',query: {
      'country':'eg',
      'category':'Science',
      'apiKey':'2c20ec06960b42aea81887dddcc57e0c'
    })
        .then((value) {

     science= value.data['articles'];

     emit(NewsGetScienceState());
    }).catchError((Error){
      print('errooooor ${Error.toString()}');});
    emit(NewsGetScienceState());
  }

void GetSettings(){
    ScreenIndex=3;
    emit(GetSettingsState());
}


  List<dynamic> search=[];
  void getSearchData(String value)
  {
    search=[];
    emit(NewsLoadingSearchState());
    DioHelper.getData(url: 'v2/everything',
        query:
        {
      'q':'$value',
      'apiKey':'2c20ec06960b42aea81887dddcc57e0c'
    })
        .then((value) {

      search= value.data['articles'];

      emit(GetSearcsState());
    }).catchError((Error){
      print('errooooor ${Error.toString()}');});
    emit(GetSearcsState());
  }

  bool isDark=false;

  void ChangeThemeMode()
  {
    isDark=!isDark;
    //emit(ChangeModeThemeState());
  }



}