abstract class MakeOrderStates {}

class MakeOrderInitialState  extends MakeOrderStates{}

class MakeOrderLoadingState extends MakeOrderStates{}

class MakeOrderGetSuccessState extends MakeOrderStates{}

class MakeOrderGetErrorState extends MakeOrderStates{
  final String error;
  MakeOrderGetErrorState({this.error});
}