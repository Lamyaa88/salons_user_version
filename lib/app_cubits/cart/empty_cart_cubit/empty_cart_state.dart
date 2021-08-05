abstract class EmptyCartStates {}

class EmptyCartInitialState  extends EmptyCartStates{}

class EmptyCartLoadingState extends EmptyCartStates{}

class EmptyCartGetSuccessState extends EmptyCartStates{}

class EmptyCartGetErrorState extends EmptyCartStates{
  final String error;
  EmptyCartGetErrorState({this.error});
}