abstract class SearchSalonsStates {}

class SearchSalonsInitialState  extends SearchSalonsStates{}

class SearchSalonsLoadingState extends SearchSalonsStates{}

class SearchSalonsGetSuccessState extends SearchSalonsStates{}

class SearchSalonsGetErrorState extends SearchSalonsStates{
  final String error;
  SearchSalonsGetErrorState({this.error});
}