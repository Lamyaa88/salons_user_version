
import 'package:almezyn/app_cubits/saved/all_saved_products_cubit/all_saved_products_cubit.dart';
import 'package:almezyn/app_cubits/saved/all_saved_products_cubit/all_saved_products_state.dart';
import 'package:almezyn/screens/more/saved_Screen.dart';
import 'package:almezyn/screens/products/single_product_details_screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
savedProductsGridView({BuildContext context}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .85,
    width: width,
    child: NetworkIndicator(
        child: BlocProvider(
      create: (BuildContext context) => AllSavedProductsCubit()..getAllSavedProducts(),
      child: ListView(
//                    physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: BlocConsumer<AllSavedProductsCubit, AllSavedProductsStates>(
              listener: (context, state) => {},
              builder: (context, state) {
                var cubit = AllSavedProductsCubit.get(context);

                if (state is! AllSavedProductsLoadingState) {
                  return Container(
                    color: whiteColor,
                    height:
                        isLandscape(context) ? 2 * height * .8 : height * .8,
                    width: width * .9,
                    child: Container(
                      child: cubit.allSavedProductsModel.data.length == 0
                          ?Center(child: customDescriptionTextText(context: context ,
                          percentageOfHeight: .025 , text: "You don\'t have any saved products"))
                          : GridView.builder(
                              itemCount: cubit.allSavedProductsModel.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: isLandscape(context)
                                          ? 2 * .95
                                          : .9995,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return customSingleProductCard(
                                  onTapDeleteFromSaved:  () {
                                    print(
                                        "delete  address tapped ");
                                    DioHelper.getAllData(
                                      url:
                                      "/delete-save/${cubit.allSavedProductsModel.data[index].id.toString()}",

                                      token: token,
                                    ).then((value) {
                                      final response =
                                          value.data;
                                      print(
                                          "response for address is   ${response}");
                                      print(
                                          "status code for adding address is   ${value.statusCode}");
                                      if(value.statusCode == 200 ){
                                        ScaffoldMessenger
                                            .of(context)
                                            .showSnackBar(
                                            SnackBar(
                                              content: Text(value.data["message"]),
                                            ));
                                        customPushNamedNavigation(context, SavedScreen());

                                      }

                                    });

                                  } ,


                                    onTapAdd: () {
                                      _addProductToCart(itemId: cubit.allSavedProductsModel.data[index].item.id , context: context);

                                    },
                                    onTap: (){customAnimatedPushNavigation(context,
                                        SingleProductDetailsScreen(productId:cubit
                                        .allSavedProductsModel.data[index].item.id.toString())) ;},
                                    context: context,
                                    imagePath:
                                        "${baseImageUrl}${cubit.allSavedProductsModel.data[index].item.image}",
                                    englishName: cubit
                                        .allSavedProductsModel.data[index].item.nameEn,

                                    englishDescription:
                                    cubit
                                        .allSavedProductsModel.data[index].item.descriptionEn,
                                    englishPrice: cubit
                                        .allSavedProductsModel.data[index].item.descriptionEn,
                                    onTapCard: () {},
                                    arabicName: cubit
                                        .allSavedProductsModel.data[index].item.nameAr,
                                    arabicDescription: cubit
                                        .allSavedProductsModel.data[index].item.descriptionAr ,
                                    arabicPrice: cubit
                                        .allSavedProductsModel.data[index].item.price );
                              }),
                    ),
                  );
                }
                return spinKit;
              },
            ),
          ),
        ],
      ),
    )),
  );
}


void _addProductToCart({BuildContext context , itemId }){
  DioHelper.postData(
    url: "/add-to-cart/${itemId}",
    data: {
      "qty" : "1"
    },
    token: token,
  ).then(
        (value) {
      print(value);
      if(value.statusCode == 200) {
        ScaffoldMessenger.of(
            context)
            .showSnackBar(
            SnackBar(
              content: Text(value.data["message"]),
            ));
      }
    },
  );
}
