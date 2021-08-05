abstract class AllOffersStates {}

class AllOffersInitialState  extends AllOffersStates{}

class AllOffersLoadingState extends AllOffersStates{}

class AllOffersGetSuccessState extends AllOffersStates{}

class AllOffersGetErrorState extends AllOffersStates{
  final String error;
  AllOffersGetErrorState({this.error});
}