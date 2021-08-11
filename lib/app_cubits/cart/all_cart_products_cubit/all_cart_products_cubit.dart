import 'package:bloc/bloc.dart';
import 'package:almezyn/Models/cart_models/all_cart_product_model.dart';
import 'package:almezyn/network/dio_helper.dart';
import 'package:almezyn/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_cart_products_state.dart';

class AllCartProductsCubit extends Cubit<AllCartProductsStates> {
  AllCartProductsCubit() : super(AllCartProductsInitialState());
  static AllCartProductsCubit get(context) => BlocProvider.of(context);
  AllCartProductsModel allCartProductsModel ;
  int  statusCode  ;
  List cartItemsList = [];
  Map allCartProductsMap = {};
  void getAllCartProducts() {
    emit(AllCartProductsLoadingState());
    DioHelper.getAllData(url: '/show-my-cart' , token: token ).then((value) async {
      statusCode = value.statusCode ;
      print("status code for cart is ${value.statusCode}");
      print("vlue.dat is ${value.data}");
      cartItemsList = value.data["cart"]["cartitems"] ;
      print("cart items  list is  ${cartItemsList}") ;
      allCartProductsModel  = AllCartProductsModel.fromJson(value.data);
      print("all cart products model is ${allCartProductsModel}");
      allCartProductsMap = value.data;
      print("all cart products map is  ${allCartProductsMap}");

      print(value.data.toString());
      if (value.statusCode == 200) {
        allCartProductsModel   = AllCartProductsModel.fromJson(value.data);
        print(  "   all cart products map is ${value.data}");
      }
      emit(AllCartProductsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllCartProductsGetErrorState(error: error.toString()));
    });
  }
}
