abstract class SingleCategoryStates {}

class SingleCategoryInitialState  extends SingleCategoryStates{}

class SingleCategoryLoadingState extends SingleCategoryStates{}

class SingleCategoryGetSuccessState extends SingleCategoryStates{}

class SingleCategoryGetErrorState extends SingleCategoryStates{
  final String error;
  SingleCategoryGetErrorState({this.error});
}