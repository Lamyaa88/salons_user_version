abstract class PendingOrdersStates {}

class PendingOrdersInitialState  extends PendingOrdersStates{}

class PendingOrdersLoadingState extends PendingOrdersStates{}

class PendingOrdersGetSuccessState extends PendingOrdersStates{}

class PendingOrdersGetErrorState extends PendingOrdersStates{
  final String error;
  PendingOrdersGetErrorState({this.error});
}