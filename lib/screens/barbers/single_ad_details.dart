import 'package:almezyn/app_cubits/ads/single_ad_cubit/single_ad_cubit.dart';
import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_cubit.dart';
import 'package:almezyn/app_cubits/offers/single_offer_cubit/single_offer_state.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
class SingleAdDetailsScreen extends StatefulWidget {
  final offerId;
  SingleAdDetailsScreen({this.offerId});
  @override
  _SingleAdDetailsScreenState createState() =>
      _SingleAdDetailsScreenState(offerId);
}
class _SingleAdDetailsScreenState
    extends State<SingleAdDetailsScreen> {
  @override
  final offerId;
  _SingleAdDetailsScreenState(this.offerId);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      child: BlocProvider(
        create: (BuildContext context) =>
        SingleOfferCubit2()..getSingleOffer2(offerId.toString()),
        child: BlocConsumer<SingleOfferCubit2, SingleOfferStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SingleOfferCubit2.get(context);

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
                              ? 2 * height * .6
                              : height * .6,
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

                          responsiveSizedBox(
                              context: context, percentageOfHeight: .01),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
//
                          CustomButton(
                            text: "show more details",
                            onTapButton: () {
                             _launchURL(cubit.singleOfferModel.data.link);
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
  }
  _launchURL(String url) async {
    url = url ;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
