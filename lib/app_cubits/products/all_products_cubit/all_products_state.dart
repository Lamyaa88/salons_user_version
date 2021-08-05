abstract class AllProductsStates {}

class AllProductsInitialState  extends AllProductsStates{}

class AllProductsLoadingState extends AllProductsStates{}

class AllProductsGetSuccessState extends AllProductsStates{}

class AllProductsGetErrorState extends AllProductsStates{
  final String error;
  AllProductsGetErrorState({this.error});
}