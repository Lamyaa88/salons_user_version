abstract class AllAdsStates {}

class AllAdsInitialState  extends AllAdsStates{}

class AllAdsLoadingState extends AllAdsStates{}

class AllAdsGetSuccessState extends AllAdsStates{}

class AllAdsGetErrorState extends AllAdsStates{
  final String error;
  AllAdsGetErrorState({this.error});
}