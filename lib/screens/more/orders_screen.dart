import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:almezyn/app_cubits/orders/all_orders_cubit/all_orders_cubit.dart';
import 'package:almezyn/app_cubits/orders/all_orders_cubit/all_orders_state.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}
//------ test

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: Text(translator.translate("Orders")),
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
          padding: EdgeInsets.only(
              right: width(context) * .0, left: width(context) * .0),
          color: backGroundColor,
          child: BlocProvider(
            create: (BuildContext context) => AllOrdersCubit()..getAllOrders(),
            child: BlocConsumer<AllOrdersCubit, AllOrdersStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = AllOrdersCubit.get(context);
                  if (state is! AllOrdersLoadingState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .05),
                          Container(
                            color: backGroundColor,
                            child: cubit.allOrdersModel.data.length == 0
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
                                                  "You didn\'t order any products yet ! ")
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
                                                .allOrdersModel.data.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  responsiveSizedBox(
                                                      context: context,
                                                      percentageOfHeight: .02),
                                                  Neumorphic(
                                                    style:  NeumorphicStyle(
                                                        shape: NeumorphicShape.flat,
                                                        depth: 5,
                                                        lightSource: LightSource.bottomLeft,
                                                        shadowLightColor: Colors.black ,
//                        shadowDarkColor: Colors.grey ,
                                                        color: backGroundColor),
                                                    child: Container(
                                                      width: width(context) * .88,
                                                      padding: EdgeInsets.only(
                                                          right: width(context) *
                                                              .03,
                                                          left: width(context) *
                                                              .03),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20)),
                                                      child: Column(
                                                        children: [
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                                  .01),
                                                          Row(
                                                            children: [
                                                              customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text:
                                                                      "Total price : ",
                                                                  textColor:
                                                                      blackColor,
                                                                  percentageOfHeight:
                                                                      .025),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text: cubit
                                                                      .allOrdersModel
                                                                      .data[index]
                                                                      .totalPrice
                                                                      .toString(),
                                                                  textColor:
                                                                      blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  percentageOfHeight:
                                                                      .025)
                                                            ],
                                                          ),
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                                  .01),
                                                          Row(
                                                            children: [
                                                              customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text: "Items:",
                                                                  textColor:
                                                                      blackColor,
                                                                  percentageOfHeight:
                                                                      .03),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text: cubit
                                                                      .allOrdersModel
                                                                      .data[index]
                                                                      .orderItems
                                                                      .length
                                                                      .toString(),
                                                                  textColor:
                                                                      blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  percentageOfHeight:
                                                                      .025)
                                                            ],
                                                          ),
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                                  .01),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: width(
                                                                        context) *
                                                                    .77,
                                                                height: height(
                                                                        context) *
                                                                    .1,
                                                                child: ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            BouncingScrollPhysics(),
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        itemCount: cubit
                                                                            .allOrdersModel
                                                                            .data[
                                                                                index]
                                                                            .orderItems
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                subindex) {
                                                                          return Container(
                                                                            width:
                                                                                width(context) * .4,
                                                                            height:
                                                                                height(context) * .1,
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Container(

                                                                                  margin: EdgeInsets.only(left: width(context) * .02),
                                                                                  width: width(context) * .4,
                                                                                  height: height(context) * .1,
                                                                                  decoration: BoxDecoration(borderRadius:
                                                                                  BorderRadius.circular(20)
                                                                                      ,image: DecorationImage(image:
                                                                                  NetworkImage("${baseImageUrl}"
                                                                                      "${cubit.allOrdersModel.data[index].orderItems[subindex].product.image}"), fit: BoxFit.cover)),
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: width(context) * .02),
                                                                                  width: width(context) * .4,
                                                                                  height: height(context) * .1,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      customDescriptionTextText(context: context,
                                                                                          textColor: whiteColor,fontWeight: FontWeight.bold,
                                                                                          text: cubit.allOrdersModel.data[index].
                                                                                          orderItems[subindex].product.nameEn),
                                                                                      customDescriptionTextText(context: context,
                                                                                          textColor: whiteColor, fontWeight: FontWeight.bold,
                                                                                          text: cubit.allOrdersModel.data[index].
                                                                                          orderItems[subindex].product.price.toString())
                                                                                    ],
                                                                                  ),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                                                                ) ,
                                                                                Container(

                                                                                  margin: EdgeInsets.only(left: width(context) * .02),
                                                                                  width: width(context) * .4,
                                                                                  height: height(context) * .1,
                                                                                  decoration: BoxDecoration(borderRadius:
                                                                                  BorderRadius.circular(20), color: Colors.black.withOpacity(.3)))
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                              ),
                                                            ],
                                                          ),
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                                  .01),
                                                          Row(
                                                            children: [
                                                              customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text:
                                                                      " Order status:",
                                                                  textColor:
                                                                      blackColor,
                                                                  percentageOfHeight:
                                                                      .03),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              customDescriptionTextText(
                                                                  context:
                                                                      context,
                                                                  text: cubit
                                                                      .allOrdersModel
                                                                      .data[index]
                                                                      .rejectReason
                                                                      .toString(),
                                                                  textColor:
                                                                      blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  percentageOfHeight:
                                                                      .025),
                                                            ],
                                                          ),
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                              .01),
                                                          Row(
                                                            children: [
                                                              customDescriptionTextText(
                                                                  context:
                                                                  context,
                                                                  text:
                                                                  "shipping address:",
                                                                  textColor:
                                                                  blackColor,
                                                                  percentageOfHeight:
                                                                  .03),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                              .01),
                                                          Container(width: width(context)*.8,
                                                            child: customDescriptionTextText(
                                                                context:
                                                                context,maxLines: 40,textAlign: TextAlign.start,
                                                                text: cubit
                                                                    .allOrdersModel
                                                                    .data[index]
                                                                    .address
                                                                    .toString(),
                                                                percentageOfHeight:
                                                                .025),) ,
                                                          responsiveSizedBox(
                                                              context: context,
                                                              percentageOfHeight:
                                                              .01),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                          ),
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
