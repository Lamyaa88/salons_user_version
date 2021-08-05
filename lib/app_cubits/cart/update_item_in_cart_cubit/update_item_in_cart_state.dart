abstract class UpdateItemInCartStates {}

class UpdateItemInCartInitialState  extends UpdateItemInCartStates{}

class UpdateItemInCartLoadingState extends UpdateItemInCartStates{}

class UpdateItemInCartGetSuccessState extends UpdateItemInCartStates{}

class UpdateItemInCartGetErrorState extends UpdateItemInCartStates{
  final String error;
  UpdateItemInCartGetErrorState({this.error});
}