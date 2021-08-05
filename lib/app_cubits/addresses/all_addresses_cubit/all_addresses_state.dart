abstract class AllAddressesStates {}

class AllAddressesInitialState  extends AllAddressesStates{}

class AllAddressesLoadingState extends AllAddressesStates{}

class AllAddressesGetSuccessState extends AllAddressesStates{}

class AllAddressesGetErrorState extends AllAddressesStates{
  final String error;
  AllAddressesGetErrorState({this.error});
}