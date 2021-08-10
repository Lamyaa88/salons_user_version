import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_cubit.dart';
import 'package:almezyn/app_cubits/users/all_barbers_cubit/all_barbers_state.dart';
import 'package:almezyn/screens/barbers/single_barber_details.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
exploreListView({BuildContext context}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return  Row(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: [
      Container(
        height: height * .25,
        child: BlocConsumer<
            AllBarbersCubit,
            AllBarbersStates>(
          listener:
              (context, state) => {},
          builder: (context, state) {
            var cubit =
            AllBarbersCubit.get(context);

            if (state
            is! AllBarbersLoadingState) {
              return Container(
                width: width,
                child:
                ListView.builder(
                    shrinkWrap:
                    true,
                    itemCount: cubit
                        .allBarbersModel
                        .data
                        .length,
                    scrollDirection:
                    Axis
                        .horizontal,
                    itemBuilder:
                        (context,
                        index) {
                      return customSingleCategoryCard(
                          onTapCard: (){
                            {
                              customAnimatedPushNavigation(context,
                                  SingleBarberDetailsScreen( barberId:cubit.allBarbersModel.data[index].id.toString()
                                    , salonId:cubit.allBarbersModel.data[index].salons[0].id.toString()
                                    ,salonName:cubit.allBarbersModel.data[index].salons[0].nameEn.toString(),
                                  salonLat:double.parse(cubit.allBarbersModel.data[index].salons[0].location[0].lat),
                                    salonLolong:double.parse(cubit.allBarbersModel.data[index].salons[0].location[0].lng),

                                  ));
                            }
                          },
                          context:
                          context,
                          englishTitle: cubit
                              .allBarbersModel
                              .data[
                          index]
                              .name,
                          imagePath: cubit
                              .allBarbersModel
                              .data[index]
                              .image);
                    }),
              );
            }
            return Container(
              width: width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection:
                  Axis.horizontal,
                  itemBuilder:
                      (context,
                      index) {
                    return customSingleCategoryCard(
                        context:
                        context,
                        isShimmer:
                        true,
                        englishTitle:
                        "",
                        imagePath:
                        "");
                  }),
            );
          },
        ),
      )
    ],
  );
}