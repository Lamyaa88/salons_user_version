import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_us_state.dart';
import 'package:almezyn/Models/contact_us_models/contact_us_model.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit() : super(ContactUsInitialState());

  /// create object from class cubit and using this with Bloc provider
  static ContactUsCubit get(context) => BlocProvider.of(context);

  List<ContactUsModel> ContactUs = [];
  Map ContactUsMap = {} ;

  void getContactUs() {
    emit(ContactUsLoadingState());
    DioHelper.postData(
      url: '/add-to-cart/1',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      ContactUsMap = value.data ;
      print ("ContactUsMap are : ${ContactUsMap}") ;
      ContactUs =
          (item as List).map((e) => ContactUsModel.fromJson(e)).toList();
      emit(ContactUsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        ContactUsGetErrorState(error: error.toString()),
      );
    });
  }
}
