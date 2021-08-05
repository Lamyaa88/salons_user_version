import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/addresses/single_address_cubit/single_address_state.dart';
import 'package:almezyn/Models/addresses_models/single_address_model.dart';

class SingleAddressCubit extends Cubit<SingleAddressStates> {
  SingleAddressCubit() : super(SingleAddressInitialState());

  /// create object from class cubit and using this with Bloc provider
  static SingleAddressCubit get(context) => BlocProvider.of(context);

  List<SingleAddressModel> categories = [];
  Map SingleAddress = {} ;

  /// get all categories in cubit
  void getSingleAddress() {
    emit(SingleAddressLoadingState());
    DioHelper.getAllData(url: '/address/1' ,token:  token ).then((value) async {
      if (value.statusCode == 200) {
        final response = await value.data;
        final item = response['data'];
        SingleAddress = response ;
        print("my data is ${response}") ;
//        categories =
//            (item ).map((e) => ToTestApisLamyaaModel.fromJson(e)).toList();
//        print( "resp ${response}") ;
      }
      emit(SingleAddressGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleAddressGetErrorState(error: error.toString()));
    });
  }



}