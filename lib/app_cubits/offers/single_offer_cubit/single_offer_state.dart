abstract class SingleOfferStates {}

class SingleOfferInitialState  extends SingleOfferStates{}

class SingleOfferLoadingState extends SingleOfferStates{}

class SingleOfferGetSuccessState extends SingleOfferStates{}

class SingleOfferGetErrorState extends SingleOfferStates{
  final String error;
  SingleOfferGetErrorState({this.error});
}