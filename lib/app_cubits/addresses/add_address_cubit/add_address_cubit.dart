import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/cart_models/add_item_to_cart_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_address_state.dart';
import 'package:almezyn/Models/addresses_models/add_address_model.dart';
class AddAddressCubit extends Cubit<AddAddressStates> {
  AddAddressCubit() : super(AddAddressInitialState());

  /// create object from class cubit and using this with Bloc provider
  static AddAddressCubit get(context) => BlocProvider.of(context);

  List<AddAddressModel> AddAddress = [];
  Map AddAddressMap = {} ;

  void getAddAddress({String lat , String lng , String icon  , String  name }) {
    emit(AddAddressLoadingState());
    DioHelper.postData(
      url: '/add-address',
      data: {"lat":lat , "lng" : lng , "icon": icon , "name" :name },
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      AddAddressMap = value.data ;
      print ("AddAddressMap are : ${AddAddressMap}") ;
      AddAddress =
          (item as List).map((e) => AddAddressModel.fromJson(e)).toList();
      emit(AddAddressGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        AddAddressGetErrorState(error: error.toString()),
      );
    });
  }
}
