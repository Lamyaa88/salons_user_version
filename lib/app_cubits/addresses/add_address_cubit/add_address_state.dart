abstract class AddAddressStates {}

class AddAddressInitialState  extends AddAddressStates{}

class AddAddressLoadingState extends AddAddressStates{}

class AddAddressGetSuccessState extends AddAddressStates{}

class AddAddressGetErrorState extends AddAddressStates{
  final String error;
  AddAddressGetErrorState({this.error});
}