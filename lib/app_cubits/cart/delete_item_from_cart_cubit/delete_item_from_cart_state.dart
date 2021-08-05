abstract class DeleteItemFromCartStates {}

class DeleteItemFromCartInitialState  extends DeleteItemFromCartStates{}

class DeleteItemFromCartLoadingState extends DeleteItemFromCartStates{}

class DeleteItemFromCartGetSuccessState extends DeleteItemFromCartStates{}

class DeleteItemFromCartGetErrorState extends DeleteItemFromCartStates{
  final String error;
  DeleteItemFromCartGetErrorState({this.error});
}