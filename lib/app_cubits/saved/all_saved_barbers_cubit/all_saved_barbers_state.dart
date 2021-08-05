abstract class AllSavedBarbersStates {}

class AllSavedBarbersInitialState  extends AllSavedBarbersStates{}

class AllSavedBarbersLoadingState extends AllSavedBarbersStates{}

class AllSavedBarbersGetSuccessState extends AllSavedBarbersStates{}

class AllSavedBarbersGetErrorState extends AllSavedBarbersStates{
  final String error;
  AllSavedBarbersGetErrorState({this.error});
}