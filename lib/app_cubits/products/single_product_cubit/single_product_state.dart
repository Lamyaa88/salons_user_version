abstract class SingleProductStates {}

class SingleProductInitialState  extends SingleProductStates{}

class SingleProductLoadingState extends SingleProductStates{}

class SingleProductGetSuccessState extends SingleProductStates{}

class SingleProductGetErrorState extends SingleProductStates{
  final String error;
  SingleProductGetErrorState({this.error});
}