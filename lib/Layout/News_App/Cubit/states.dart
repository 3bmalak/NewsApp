
abstract class NewsAppStates{}

class NewsInitState extends NewsAppStates{}
class NewsBottomNavState extends NewsAppStates{}

class NewsLoadingBusinessState extends NewsAppStates{}
class NewsGetBusinessState extends NewsAppStates{}
class NewsBusinessErrorState extends NewsAppStates{
   final String Error ;

  NewsBusinessErrorState(this.Error);

}

class NewsLoadingSportState extends NewsAppStates{}
class NewsGetSportState extends NewsAppStates{}
class NewsSportErrorState extends NewsAppStates{
  final String Error ;
  NewsSportErrorState(this.Error);
}

class NewsLoadingScienceState extends NewsAppStates{}

class NewsGetScienceState extends NewsAppStates{}
class NewsScienceErrorState extends NewsAppStates{
  final String Error ;
  NewsScienceErrorState(this.Error);
}
 class GetSettingsState extends NewsAppStates{}

 class GetSearcsState extends NewsAppStates{}
class NewsLoadingSearchState extends NewsAppStates{}
class youssefState extends NewsAppStates{}

