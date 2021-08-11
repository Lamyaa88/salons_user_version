import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_cubit.dart';
import 'package:almezyn/app_cubits/cart/all_cart_products_cubit/all_cart_products_state.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/custom_widgets/custom_single_item_will_be_ordered_card.dart';
import 'package:almezyn/screens/other/order_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backGroundColor,
      appBar:  AppBar(
        title: Text(translator.translate("Checkout")),
        elevation: 0,
        backgroundColor: whiteColor,
        textTheme: Theme.of(context).textTheme,
        leading:  IconButton(icon:Icon(Icons.arrow_back_ios ,color: blackColor,), onPressed: (){
          Navigator.of(context).pop();
        }),
        centerTitle: true,
      ),
      body:   NetworkIndicator(
        child: Container(
          color:backGroundColor ,
          child: BlocProvider(
            create: (BuildContext context ) => AllCartProductsCubit()..getAllCartProducts() ,
            child: BlocConsumer<AllCartProductsCubit , AllCartProductsStates>(
                listener: (context,state){},
                builder: (context , state ){
                  var cubit = AllCartProductsCubit.get(context) ;
                  if(state is! AllCartProductsLoadingState){
                    return  SingleChildScrollView(
                      child:

                    Column(
                      children: [

        responsiveSizedBox(context : context , percentageOfHeight: .05),
                        Container(height: height(context)*.6,
                          child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: cubit.allCartProductsModel.cart.cartitems.length ,
                          itemBuilder: (context, index) {
                            return customSingleItemWillBeOrderedCard(
                                context: context,
                                onTapCard: () {
                                  print(
                                    "category card presswed",
                                  );
                                },
                                arabicName: cubit.allCartProductsModel.cart.cartitems[index].product.nameAr ,
                                arabicPrice: cubit.allCartProductsModel.cart.cartitems[index].product.price.toString(),
                                englishPrice: cubit.allCartProductsModel.cart.cartitems[index].product.price.toString() ,
                                englishName: cubit.allCartProductsModel.cart.cartitems[index].product.nameEn ,
                              productQuantity: cubit.allCartProductsModel.cart.cartitems[index].qty ,
                              itemTotal:
                              ((double.parse(cubit.allCartProductsModel.cart.cartitems[index].qty.toString()))
                                  *(double.parse(cubit.allCartProductsModel.cart.cartitems[index].price))).toString()
                              );

                          }),
                        ),
                        responsiveSizedBox(context : context , percentageOfHeight: .05),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: customDescriptionTextText(context: context ,
                                text: "cart total is ${cubit.allCartProductsModel.total.toString() }" ,percentageOfHeight:
                                .03, textColor: blackColor , fontWeight: FontWeight.bold),),
                          ],
                        ),
                        responsiveSizedBox(context : context , percentageOfHeight: .05),

                        CustomButton(text:translator.translate("Continue To Order") ,onTapButton:
            (){
              customPushNamedNavigation(context, OrderScreen());
//
            },)
                      ],
                    )
                    ) ;
                  } return spinKit ;
                  ;}
            ),
          ),
        ),
      ),);






//    return Scaffold(
//      appBar:  AppBar(
//        title: Text(translator.translate("Checkout")),
//        elevation: 0,
//        backgroundColor: whiteColor,
//        textTheme: Theme.of(context).textTheme,
//        leading:  IconButton(icon:Icon(Icons.arrow_back_ios ,color: blackColor,), onPressed: (){
//          Navigator.of(context).pop();
//        }),
//        centerTitle: true,
//      ),
//      body:   SingleChildScrollView(
//        child: Column(
//          children: [
//
//            responsiveSizedBox(context : context , percentageOfHeight: .05),
//            Container(width: width(context)*.9,
//              child: Row(mainAxisAlignment: MainAxisAlignment.start,
//                children: [customDescriptionTextText(
//                    percentageOfHeight: .022,
//                    text:translator.translate("Items Details :"),
//                    textAlign: TextAlign.start,
//                    context: context,
//                    textColor: blackColor,
//                    fontWeight: FontWeight.bold
//                ),
//
//                 ],),
//            ),
//            responsiveSizedBox(context : context , percentageOfHeight: .03),
//
////            Container(height: height(context)*.55,
//              child: ListView.builder(
//                  shrinkWrap: true,
//                  physics: BouncingScrollPhysics(),
//                  scrollDirection: Axis.vertical,
//                  itemCount: 10,
//                  itemBuilder: (context, index) {
//                    return customSingleItemWillBeOrderedCard(
//                        context: context,
//                        onTapCard: () {
//                          print(
//                            "category card presswed",
//                          );
//                        },
//                        imagePath:
//                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVasJktTkWcOcuubkXx2jzhYm8vF5hdRv4QQ&usqp=CAU",
//                        arabicName: "منتج للعناية بالشعر",
//                         arabicPrice: "40",
//                        englishPrice: "40",
//                        englishName: "Kings Salon salon",
//                        arabicDescription: "صالون لحلاقة الشعر ",
//                        englishDescription: "kings salon for hair cut and beard shaving"  );
//                  }),
//            ),
//
//            responsiveSizedBox(context : context , percentageOfHeight: .03),
//            Container(width: width(context)*.9,
//              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [customDescriptionTextText(
//                percentageOfHeight: .022,
//                text:translator.translate("Total Amount To Be Paid") ,
//                textAlign: TextAlign.start,
//                context: context,
//                textColor: blackColor,
//                fontWeight: FontWeight.bold
//              ),
//                  customDescriptionTextText(
//                      percentageOfHeight: .022,
//                      text:"\$ 1000 " ,
//                      textAlign: TextAlign.start,
//                      context: context,
//                      textColor: blackColor,
//                      fontWeight: FontWeight.bold
//                  ),],),
//            ),
//            responsiveSizedBox(context : context , percentageOfHeight: .05),
//            CustomButton(text:translator.translate("Continue To Order") ,onTapButton:
//            (){
//              customPushNamedNavigation(context, OrderScreen());
//
//            },)
//          ],
//        ),
//      ),);
  }
}
