abstract class DeleteAddressStates {}

class DeleteAddressInitialState  extends DeleteAddressStates{}

class DeleteAddressLoadingState extends DeleteAddressStates{}

class DeleteAddressGetSuccessState extends DeleteAddressStates{}

class DeleteAddressGetErrorState extends DeleteAddressStates{
  final String error;
  DeleteAddressGetErrorState({this.error});
}