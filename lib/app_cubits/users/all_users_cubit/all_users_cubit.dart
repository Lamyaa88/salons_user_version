import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/users_models/all_users_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersStates> {
  AllUsersCubit() : super(AllUsersInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AllUsersCubit get(context) => BlocProvider.of(context);

  List<AllUsersModel> allUsers = [];

  /// get all categories in cubit
  void getAllUsers() {
    emit(AllUsersLoadingState());
    DioHelper.getAllData(url: '//past-user-appointments').then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        allUsers =
            (item as List).map((e) => AllUsersModel.fromJson(e)).toList();
        print("categories are ${response}");
      }
      emit(AllUsersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllUsersGetErrorState(error: error.toString()));
    });
  }
}
