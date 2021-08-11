import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_cubit.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';
import 'package:almezyn/screens/products/single_product_details_screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'check_out_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}
//------ test

class _CartScreenState extends State<CartScreen> {
  int cartNumper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: Text(translator.translate("Cart")),
        elevation: 0,
        backgroundColor: whiteColor,
        textTheme: Theme.of(context).textTheme,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: blackColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
      ),
      body: NetworkIndicator(
        child: Container(
          color: backGroundColor,
          child: BlocProvider(
            create: (BuildContext context) =>
                AllCartProductsCubit()..getAllCartProducts(),
            child: BlocConsumer<AllCartProductsCubit, AllCartProductsStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = AllCartProductsCubit.get(context);
                  if (state is! AllCartProductsLoadingState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .05),
                          Container(
                              color: backGroundColor,
                              child: cubit.allCartProductsModel.cart == null
                                  ? Column(
                                      children: [
                                        responsiveSizedBox(
                                            context: context,
                                            percentageOfHeight: .2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            customDescriptionTextText(
                                                context: context,
                                                text:
                                                    "you dont have any products in your cart")
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          height: height(context) * .7,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: cubit
                                                  .allCartProductsModel
                                                  .cart
                                                  .cartitems
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return customSingleCartItemCard(
                                                    onTapDeleteItem: () {
                                                      DioHelper.getAllData(
                                                              url:
                                                                  "/delete-from-cart/${cubit.allCartProductsModel.cart.cartitems[index].id.toString()}",
                                                              token: token)
                                                          .then((value) {
                                                        if (value.statusCode ==
                                                            200) {
                                                          customPushNamedNavigation(
                                                              context,
                                                              CartScreen());
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: customDescriptionTextText(
                                                                      context:
                                                                          context,
                                                                      text:
                                                                          "Item deleted successfully !")));
                                                        }
                                                      });
                                                    },
                                                    context: context,
                                                    onTapIncrease: () {
                                                      DioHelper.postData(
                                                          url:
                                                              "/update-cart/${cubit.allCartProductsModel.cart.cartitems[index].id}",
                                                          token: token,
                                                          data: {
                                                            "qty":
                                                                "${(double.parse(cubit.allCartProductsModel.cart.cartitems[index].qty)) + 1}"
                                                          }).then((value) =>
                                                          print(value.data));
                                                      customPushNamedNavigation(
                                                          context,
                                                          CartScreen());
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text:
                                                                      "your cart updated successfully ! ")));
                                                    },
                                                    onTapDecrease: () {
                                                      if (double.parse(cubit
                                                              .allCartProductsModel
                                                              .cart
                                                              .cartitems[index]
                                                              .qty) ==
                                                          1) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: customDescriptionTextText(
                                                                    context:
                                                                        context,
                                                                    text:
                                                                        "Number of items cant be less than 1 ")));
                                                      } else {
                                                        DioHelper.postData(
                                                            url:
                                                                "/update-cart/${cubit.allCartProductsModel.cart.cartitems[index].id}",
                                                            token: token,
                                                            data: {
                                                              "qty":
                                                                  "${(double.parse(cubit.allCartProductsModel.cart.cartitems[index].qty)) - 1}"
                                                            }).then((value) =>
                                                            print(value.data));
                                                        customPushNamedNavigation(
                                                            context,
                                                            CartScreen());
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: customDescriptionTextText(
                                                                    context:
                                                                        context,
                                                                    text:
                                                                        "your cart updated successfully ! ")));
                                                      }
                                                    },
                                                    onTapCard: () {
                                                      customAnimatedPushNavigation(
                                                          context,
                                                          SingleProductDetailsScreen(
                                                              productId: cubit
                                                                  .allCartProductsModel
                                                                  .cart
                                                                  .cartitems[
                                                                      index]
                                                                  .product
                                                                  .id
                                                                  .toString()));
                                                    },
                                                    imagePath:
                                                        "${baseImageUrl}${cubit.allCartProductsModel.cart.cartitems[index].product.image}",
                                                    productQuantity:
                                                        double.parse(cubit
                                                            .allCartProductsModel
                                                            .cart
                                                            .cartitems[index]
                                                            .qty),
                                                    arabicName: cubit
                                                        .allCartProductsModel
                                                        .cart
                                                        .cartitems[index]
                                                        .product
                                                        .nameEn,
                                                    englishName: cubit
                                                        .allCartProductsModel
                                                        .cart
                                                        .cartitems[index]
                                                        .product
                                                        .nameEn,

                                                    arabicDescription:
                                                        "${cubit.allCartProductsModel.cart.cartitems[index].product.price} L.E",
                                                    englishDescription:
                                                        "${cubit.allCartProductsModel.cart.cartitems[index].product.price} L.E");
                                              }),
                                        ),
                                        Container(
                                          child:cubit.allCartProductsModel.total == 0 ? SizedBox() :
                                          CustomButton(
                                            text:
                                                translator.translate("Checkout"),
                                            onTapButton: () {
                                              customAnimatedPushNavigation(
                                                  context, CheckOutScreen());

                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .05),
//                        CustomButton(text: translator.translate("Checkout"), onTapButton:()
//                        { customAnimatedPushNavigation(context, CheckOutScreen());},)
                        ],
                      ),
                    );
                  }
                  return spinKit;
                  ;
                }),
          ),
        ),
      ),
    );
  }
}
