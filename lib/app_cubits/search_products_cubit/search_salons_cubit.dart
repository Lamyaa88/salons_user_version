import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:almezyn/app_cubits/search_products_cubit/search_salons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/Models/salons_models/search_salons_model.dart';

class SearchSalonssCubit extends Cubit<SearchSalonsStates> {
  SearchSalonssCubit() : super(SearchSalonsInitialState());
  static SearchSalonssCubit get(context) => BlocProvider.of(context);
  SearchSalonsModel searchSalonssModel ;
  int statusCode ;
  void getSearchSalonss( String searchWord) {
    emit(SearchSalonsLoadingState());
    DioHelper.getAllData(url: '/search-salon?name=${searchWord}' , token: token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        print(response) ;
        statusCode = value.statusCode ;
        searchSalonssModel  = SearchSalonsModel.fromJson(value.data);

      }
      emit(SearchSalonsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SearchSalonsGetErrorState(error: error.toString()));
    });
  }
}
