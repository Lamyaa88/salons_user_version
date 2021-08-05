abstract class AllSavedSalonsStates {}

class AllSavedSalonsInitialState  extends AllSavedSalonsStates{}

class AllSavedSalonsLoadingState extends AllSavedSalonsStates{}

class AllSavedSalonsGetSuccessState extends AllSavedSalonsStates{}

class AllSavedSalonsGetErrorState extends AllSavedSalonsStates{
  final String error;
  AllSavedSalonsGetErrorState({this.error});
}