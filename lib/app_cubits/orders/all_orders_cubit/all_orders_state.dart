abstract class AllOrdersStates {}

class AllOrdersInitialState  extends AllOrdersStates{}

class AllOrdersLoadingState extends AllOrdersStates{}

class AllOrdersGetSuccessState extends AllOrdersStates{}

class AllOrdersGetErrorState extends AllOrdersStates{
  final String error;
  AllOrdersGetErrorState({this.error});
}