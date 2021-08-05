import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/users/search_barbers_cubit/search_barbers_state.dart';
import 'package:almezyn/Models/users_models/search_barber_model.dart';
class SearchBarbersCubit extends Cubit<SearchBarbersStates> {
  SearchBarbersCubit() : super(SearchBarbersInitialState());
  static SearchBarbersCubit get(context) => BlocProvider.of(context);
  SearchBarbersModel searchBarbersModel ;
  int statusCode ;
  void getSearchBarbers( String searchWord) {
    emit(SearchBarbersLoadingState());
    DioHelper.getAllData(url: '/search-barber?name=${searchWord}' , token: token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        print(response) ;
        statusCode = value.statusCode ;
        searchBarbersModel  = SearchBarbersModel.fromJson(value.data);

      }
      emit(SearchBarbersGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SearchBarbersGetErrorState(error: error.toString()));
    });
  }
}
