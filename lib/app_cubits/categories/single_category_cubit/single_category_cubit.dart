
import 'package:almezyn/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/categories/single_category_cubit/single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryStates> {
  SingleCategoryCubit() : super(SingleCategoryInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleCategoryCubit get(context) => BlocProvider.of(context);

//  List<ToTestApisLamyaaModel> categories = [];
  Map SingleCategory = {} ;

  /// get all categories in cubit
  void getSingleCategory() {
    emit(SingleCategoryLoadingState());
    DioHelper.getAllData(url: '//single-ad/1').then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        SingleCategory = response ;
        print("my data is ${response}") ;
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleCategoryGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleCategoryGetErrorState(error: error.toString()));
    });
  }



}