import 'package:almezyn/Models/faqs_models/faqs_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/faqs_cubit/faqs_tates.dart';
class AllFaqsCubit extends Cubit<AllFaqsStates> {
  AllFaqsCubit() : super(AllFaqsInitialState());
  static AllFaqsCubit get(context) => BlocProvider.of(context);
 AllFaqsModel allFaqsModel ;
  int statusCode ;
  void getAllFaqs() {
    emit(AllFaqsLoadingState());
    DioHelper.getAllData(url: '/faqs' , token: token ).then((value) async {
        print("all data  is ${value.data}") ;
        statusCode = value.statusCode ;
        allFaqsModel   = AllFaqsModel.fromJson(value.data);


      emit(AllFaqsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllFaqsGetErrorState(error: error.toString()));
    });
  }
}





