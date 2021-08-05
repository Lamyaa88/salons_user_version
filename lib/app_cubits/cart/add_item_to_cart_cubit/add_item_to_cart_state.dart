abstract class AddItemToCartStates {}

class AddItemToCartInitialState  extends AddItemToCartStates{}

class AddItemToCartLoadingState extends AddItemToCartStates{}

class AddItemToCartGetSuccessState extends AddItemToCartStates{}

class AddItemToCartGetErrorState extends AddItemToCartStates{
  final String error;
  AddItemToCartGetErrorState({this.error});
}