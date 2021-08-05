abstract class SingleUserStates {}

class SingleUserInitialState  extends SingleUserStates{}

class SingleUserLoadingState extends SingleUserStates{}

class SingleUserGetSuccessState extends SingleUserStates{}

class SingleUserGetErrorState extends SingleUserStates{
  final String error;
  SingleUserGetErrorState({this.error});
}