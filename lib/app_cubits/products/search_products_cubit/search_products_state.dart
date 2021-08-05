abstract class SearchProductsStates {}

class SearchProductsInitialState  extends SearchProductsStates{}

class SearchProductsLoadingState extends SearchProductsStates{}

class SearchProductsGetSuccessState extends SearchProductsStates{}

class SearchProductsGetErrorState extends SearchProductsStates{
  final String error;
  SearchProductsGetErrorState({this.error});
}