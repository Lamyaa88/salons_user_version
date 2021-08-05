abstract class SingleAddressStates {}

class SingleAddressInitialState  extends SingleAddressStates{}

class SingleAddressLoadingState extends SingleAddressStates{}

class SingleAddressGetSuccessState extends SingleAddressStates{}

class SingleAddressGetErrorState extends SingleAddressStates{
  final String error;
  SingleAddressGetErrorState({this.error});
}