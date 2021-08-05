import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_addresses_state.dart';
import 'package:almezyn/Models/addresses_models/all_addresses_model.dart';

class AllAddressesCubit extends Cubit<AllAddressesStates> {
  AllAddressesCubit() : super(AllAddressesInitialState());
  static AllAddressesCubit get(context) => BlocProvider.of(context);
AllAddressesModel addressesModel ;
  /// get all categories in cubit
  void getAllAddresses() {
    emit(AllAddressesLoadingState());
    DioHelper.getAllData(url: '/my-addresses' , token: token ).then((value) async {
      addressesModel = AllAddressesModel.fromJson(value.data);
      emit(AllAddressesGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllAddressesGetErrorState(error: error.toString()));
    });
  }
}
