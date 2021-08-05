import 'package:bloc/bloc.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_address_state.dart';
import 'package:almezyn/Models/addresses_models/delete_address_model.dart';
class DeleteAddressCubit extends Cubit<DeleteAddressStates> {
  DeleteAddressCubit() : super(DeleteAddressInitialState());

  /// create object from class cubit and using this with Bloc provider
  static DeleteAddressCubit get(context) => BlocProvider.of(context);

  List<DeleteAddressModel> DeleteAddress = [];
  Map DeleteAddressMap = {} ;

  void getDeleteAddress() {
    emit(DeleteAddressLoadingState());
    DioHelper.postData(
      url: '/delete-address',
      data: {"qty" :"1"},
      token: token,
    ).then((value) {
      final response = value.data;
      final item = response['data'];
      DeleteAddressMap = value.data ;
      print ("DeleteAddressMap are : ${DeleteAddressMap}") ;
      DeleteAddress =
          (item as List).map((e) => DeleteAddressModel.fromJson(e)).toList();
      emit(DeleteAddressGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(
        DeleteAddressGetErrorState(error: error.toString()),
      );
    });
  }
}
