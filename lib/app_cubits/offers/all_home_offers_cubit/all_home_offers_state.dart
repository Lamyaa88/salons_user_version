abstract class AllHomeOffersStates {}

class AllHomeOffersInitialState  extends AllHomeOffersStates{}

class AllHomeOffersLoadingState extends AllHomeOffersStates{}

class AllHomeOffersGetSuccessState extends AllHomeOffersStates{}

class AllHomeOffersGetErrorState extends AllHomeOffersStates{
  final String error;
  AllHomeOffersGetErrorState({this.error});
}