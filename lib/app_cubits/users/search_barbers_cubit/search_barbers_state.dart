abstract class SearchBarbersStates {}

class SearchBarbersInitialState  extends SearchBarbersStates{}

class SearchBarbersLoadingState extends SearchBarbersStates{}

class SearchBarbersGetSuccessState extends SearchBarbersStates{}

class SearchBarbersGetErrorState extends SearchBarbersStates{
  final String error;
  SearchBarbersGetErrorState({this.error});
}