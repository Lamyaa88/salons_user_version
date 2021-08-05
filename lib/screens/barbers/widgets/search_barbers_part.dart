import 'package:almezyn/app_cubits/search_products_cubit/search_salons_cubit.dart';
import 'package:almezyn/app_cubits/search_products_cubit/search_salons_state.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/screens/salons/single_salon_details_screen.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/users/search_barbers_cubit/search_barbers_state.dart';
import 'package:almezyn/app_cubits/users/search_barbers_cubit/search_barbers_cubit.dart';

searchBarbersPart({ BuildContext context , String searchWord }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return     Container(
    height: height * .85,
    width: width,
    child: NetworkIndicator(
        child: BlocProvider(
          create: (BuildContext context) =>
          SearchBarbersCubit()..getSearchBarbers(searchWord),
          child: ListView(
//                    physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                child:
                BlocConsumer<SearchBarbersCubit, SearchBarbersStates>(
                  listener: (context, state) => {},
                  builder: (context, state) {
                    var cubit = SearchBarbersCubit.get(context);
                    if (state is! SearchBarbersLoadingState) {
                      return Row(
                        children: [
                          Container(
                              height:
                              isLandscape(context) ? 2 * height * .4 : height * .4,
                              width: width,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: cubit.searchBarbersModel.data.length,
                                  itemBuilder: (context, index) {
                                    return customSingleSalonCard(
                                  context:  context , arabicName: cubit.searchBarbersModel.data[index].name ,
                                      specialitiesList: cubit.searchBarbersModel.data[index].specifications,
                                      englishName: cubit.searchBarbersModel.data[index].name ,
                                      imagePath: cubit.searchBarbersModel.data[index].image ,
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