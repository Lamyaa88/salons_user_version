abstract class AllCartProductsStates {}

class AllCartProductsInitialState  extends AllCartProductsStates{}

class AllCartProductsLoadingState extends AllCartProductsStates{}

class AllCartProductsGetSuccessState extends AllCartProductsStates{}

class AllCartProductsGetErrorState extends AllCartProductsStates{
  final String error;
  AllCartProductsGetErrorState({this.error});
}