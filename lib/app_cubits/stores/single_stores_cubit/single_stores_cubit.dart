
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/stores/single_stores_cubit/single_stores_state.dart';
class SingleStoreCubit extends Cubit<SingleStoreStates> {
  SingleStoreCubit() : super(SingleStoreInitialState());
  /// create object from class cubit and using this with Bloc provider
  static SingleStoreCubit get(context) => BlocProvider.of(context);
//  List<ToTestApisLamyaaModel> categories = [];
  Map SingleStoreMap = {} ;

  /// get all categories in cubit
  void getSingleStore() {
    emit(SingleStoreLoadingState());
    DioHelper.getAllData(url: '/single-store/1' , token: token).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        SingleStoreMap = response ;
        print("my data is ${response}") ;

        print("status code for single store   : ${value.statusCode}");
        print("response in  single store   : ${response}");
        print("single store  model is  :  ${SingleStoreMap}");
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleStoreGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleStoreGetErrorState(error: error.toString()));
    });
  }



}