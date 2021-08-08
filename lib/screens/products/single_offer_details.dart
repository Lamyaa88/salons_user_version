import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_cubit.dart';
import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_state.dart';
import 'package:almezyn/app_cubits/products/single_product_cubit/single_product_cubit.dart';
import 'package:almezyn/app_cubits/products/single_product_cubit/single_product_state.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
class SingleOfferDetailsScreen extends StatefulWidget {
  final offerId;
  SingleOfferDetailsScreen({this.offerId});
  @override
  _SingleOfferDetailsScreenState createState() =>
      _SingleOfferDetailsScreenState(offerId);
}
class _SingleOfferDetailsScreenState
    extends State<SingleOfferDetailsScreen> {
  @override
  final offerId;
  _SingleOfferDetailsScreenState(this.offerId);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      child: BlocProvider(
        create: (BuildContext context) =>
            SingleOfferCubit()..getSingleOffer(offerId.toString()),
        child: BlocConsumer<SingleOfferCubit, SingleOfferStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SingleOfferCubit.get(context);

            if (state is! SingleOfferLoadingState) {
              return Scaffold(
                body: Container(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leading: null,
                          expandedHeight: isLandscape(context)
                              ? 2 * height * .5
                              : height * .5,
                          backgroundColor: whiteColor,
                          floating: false,
                          pinned: false,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              height: isLandscape(context)
                                  ? 2 * height * .3
                                  : height * .3,
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${baseImageUrl}${cubit.singleOfferModel.data.image}"),
                                  fit: isLandscape(context)
                                      ? BoxFit.fitHeight
                                      : BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .05),
                          customDescriptionTextText(
                              context: context,
                              textColor: blackColor,
                              text: checkDirection(
                                cubit.singleOfferModel.data.nameAr,
                                cubit.singleOfferModel.data.nameEn,
                              ),
                              maxLines: 5,
                              fontWeight: FontWeight.bold,
                              percentageOfHeight: .03),

                          responsiveSizedBox(
                              context: context, percentageOfHeight: .01),
                          customDescriptionTextText ( context: context,text:
                            " L.E ${checkDirection(
                                cubit.singleOfferModel.data.value,
                                cubit.singleOfferModel.data.value)}",
                              percentageOfHeight: .03,
                              maxLines: 5),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .01),

                          customDescriptionTextText(
                              context: context,
                              text: checkDirection(
                                " ${cubit.singleOfferModel.data.code}",
                                " ${cubit.singleOfferModel.data.code}",
                              ),
                              percentageOfHeight: .03),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
//
                          CustomButton(
                            text: "Copy",
                            onTapButton: () {
                              Clipboard.setData(ClipboardData(text:cubit.singleOfferModel.data.code)).then((value) =>
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text("copied sucesfully to your clipboard ! "))));
                            },
                          ),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return spinKit;
          },
        ),
      ),
    );
  }}
