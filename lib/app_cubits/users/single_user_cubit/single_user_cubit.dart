import 'package:almezyn/app_cubits/users/single_user_cubit/single_user_state.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleUserCubit extends Cubit<SingleUserStates> {
  SingleUserCubit() : super(SingleUserInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleUserCubit get(context) => BlocProvider.of(context);

//  List<ToTestApisLamyaaModel> categories = [];
  Map singleUser = {} ;

  /// get all categories in cubit
  void getSingleUser() {
    emit(SingleUserLoadingState());
    DioHelper.getAllData(url: '//single-user/13').then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        singleUser = response ;
        print("my data is ${response}") ;
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleUserGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleUserGetErrorState(error: error.toString()));
    });
  }



}