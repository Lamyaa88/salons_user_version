abstract class ShippingOrdersStates {}

class ShippingOrdersInitialState  extends ShippingOrdersStates{}

class ShippingOrdersLoadingState extends ShippingOrdersStates{}

class ShippingOrdersGetSuccessState extends ShippingOrdersStates{}

class ShippingOrdersGetErrorState extends ShippingOrdersStates{
  final String error;
  ShippingOrdersGetErrorState({this.error});
}