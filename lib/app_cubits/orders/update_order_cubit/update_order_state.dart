abstract class UpdateOrderStates {}

class UpdateOrderInitialState  extends UpdateOrderStates{}

class UpdateOrderLoadingState extends UpdateOrderStates{}

class UpdateOrderGetSuccessState extends UpdateOrderStates{}

class UpdateOrderGetErrorState extends UpdateOrderStates{
  final String error;
  UpdateOrderGetErrorState({this.error});
}