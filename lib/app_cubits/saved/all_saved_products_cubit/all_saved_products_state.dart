abstract class AllSavedProductsStates {}

class AllSavedProductsInitialState  extends AllSavedProductsStates{}

class AllSavedProductsLoadingState extends AllSavedProductsStates{}

class AllSavedProductsGetSuccessState extends AllSavedProductsStates{}

class AllSavedProductsGetErrorState extends AllSavedProductsStates{
  final String error;
  AllSavedProductsGetErrorState({this.error});
}