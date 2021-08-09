import 'package:almezyn/app_cubits/ads/all_ads_cubit/all_ads_cubit.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/screens/barbers/widgets/top_slider.dart';
import 'package:almezyn/screens/barbers/widgets/ads_listview.dart';
import 'package:almezyn/screens/barbers/widgets/search_barbers_part.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:almezyn/app_cubits/specifications/all_categories_cubit/all_specifications_cubit.dart';
import 'package:almezyn/screens/salons/widgets/specifications_list_view.dart';
class BarbersHomeScreen extends StatefulWidget {
  @override
  _BarbersHomeScreenState createState() => _BarbersHomeScreenState();
}
class _BarbersHomeScreenState extends State<BarbersHomeScreen> {
  String searchInputs = "" ;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NetworkIndicator(
        child: CustomBuildBody(
          onTapBackIcon: (){Navigator.pop(context);},
          paddingPercentageForBody: 0.0,
          columnOfWidgets: Column(
            children: [
              Container(
                height: height,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          expandedHeight:isLandscape(context) ? 2*height*.4: height*.4,
                          floating: false,
                          backgroundColor: whiteColor,
                          elevation: 0,
                          pinned: false,
                          foregroundColor: Colors.white,
                          flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                  child:Container(
                                    child: Row(
                                      children: [
                                        Column(mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            barbersTopSlider(context:  context)
                                          ],),

                                      ],),
                                  ))),
                        ),
                      ];
                    },
                    body: Container(
                      child:MultiBlocProvider(
                        providers: [
                          BlocProvider<AllSpecificationsCubit>(
                            create: (BuildContext context) => AllSpecificationsCubit()..getAllSpecifications(),
                          ),
                          BlocProvider<AllOffersCubit>(
                            create: (BuildContext context) =>
                            AllOffersCubit()..getAllOffers(),
                          ),
                          BlocProvider<AllOffersCubit2>(
                            create: (BuildContext context) =>
                            AllOffersCubit2()..getAllOffers2(),
                          ),


                        ],
                        child: ListView(
//              physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            responsiveSizedBox(context: context, percentageOfHeight: .0) ,
                            boldTitleRow(context: context , text: "Find barbers" , withViewMore: false
                                ,textColor: blackColor , fontWeight: FontWeight.bold , heightPercentage: .03) ,
                            responsiveSizedBox(context: context, percentageOfHeight: .02) ,
                            CustomTextField(hint: "Search" , onChange: (v){
                              setState(() {
                                searchInputs = v ;
                              });
                              print(searchInputs) ;
                            },

                            ),
                            responsiveSizedBox(context: context, percentageOfHeight: .03),
                            Container(
                                child:
                                searchInputs == "" ?

                                Column(
                                  children: [
                                    Column(children: [
                                      boldTitleRow(context: context , text: "Specifications") ,
                                      responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                      specificationListView(context : context),
                                      responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                      boldTitleRow(context: context , text: "ads") ,
                                      responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                     adsListView(context: context),
                                      responsiveSizedBox(context: context, percentageOfHeight: .03)
                                      ,],),],):searchBarbersPart(context : context , searchWord: searchInputs)),
                            responsiveSizedBox(context: context, percentageOfHeight: .3) ,

                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

