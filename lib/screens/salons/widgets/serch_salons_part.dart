import 'package:almezyn/app_cubits/search_products_cubit/search_salons_cubit.dart';
import 'package:almezyn/app_cubits/search_products_cubit/search_salons_state.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../single_salon_details_screen.dart';


searchSalonsPart({ BuildContext context , String searchWord }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return     Container(
    height: height * .85,
    width: width,
    child: NetworkIndicator(
        child: BlocProvider(
          create: (BuildContext context) =>
          SearchSalonssCubit()..getSearchSalonss(searchWord),
          child: ListView(
//                    physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                child:
                BlocConsumer<SearchSalonssCubit, SearchSalonsStates>(
                  listener: (context, state) => {},
                  builder: (context, state) {
                    var cubit = SearchSalonssCubit.get(context);
                    if (state is! SearchSalonsLoadingState) {
                      return Row(
                        children: [
                          Container(
                              height:
                              isLandscape(context) ? 2 * height * .4 : height * .4,
                              width: width,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: cubit.searchSalonssModel.data.length,
                                  itemBuilder: (context, index) {
                                    return customSingleSalonCard(
                                        context: context,
                                        onTapCard:
                                            (){customAnimatedPushNavigation(context,
                                            SingleSalonDetailsScreen( salonId:cubit.searchSalonssModel.data[index].id.toString() ,
                                                salonLat: double.parse(cubit.searchSalonssModel.data[index].location[0].lat) ,
                                            salonLong:double.parse(cubit.searchSalonssModel.data[index].location[0].lng),));},

                                        arabicName:  cubit.searchSalonssModel.data[index].nameAr ,
                                        englishName:cubit.searchSalonssModel.data[index].nameEn ,
                                        imagePath2:cubit.searchSalonssModel.data[index].images[0],
                                        imagePath:cubit.searchSalonssModel.data[index].images[0] ,
                                        arabicDescription:   cubit.searchSalonssModel.data[index].descriptionAr  ,
                                        englishDescription: cubit.searchSalonssModel.data[index].descriptionEn,
                                        specialitiesList: cubit.searchSalonssModel.data[index].specialities
                                    );
                                  })),
                        ],
                      );
                    }
                    return customDefaultShimmerListView(context: context);
                  },
                ),
              ),
            ],
          ),
        )),
  );
}