import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_state.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/screens/salons/single_salon_details_screen.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

allSalonsListView2({BuildContext context, Function onTapSingleSalon}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    height: height * .4,
    width: width,
    child: NetworkIndicatorWithoutImage(
      child: Container(
        child: BlocConsumer<AllSalonsCubit, AllSalonsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AllSalonsCubit.get(context);
            if (state is! AllSalonsLoadingState) {
              return Row(
                children: [
                  Container(
                      height:
                          isLandscape(context) ? 2 * height * .4 : height * .4,
                      width: width,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: cubit.allSalonsModel.data.length,
                          itemBuilder: (context, index) {
                            return customSingleSalonCard(
                              context: context,
                              onTapCard:
                              (){customAnimatedPushNavigation(context,
                                  SingleSalonDetailsScreen(salonId: cubit.allSalonsModel.data[index].id.toString(),salonLat:
                                  double.parse(cubit.allSalonsModel.data[index].location[0].lat),
                                    salonLong: double.parse(cubit.allSalonsModel.data[index].location[0].lat),));},
                              arabicName:  cubit.allSalonsModel.data[index].nameAr ,
                              englishName:cubit.allSalonsModel.data[index].nameEn ,
                              imagePath2:cubit.allSalonsModel.data[index].images[0],
                              imagePath:"${baseImageUrl}${cubit.allSalonsModel.data[index].images.toString()}",
                              arabicDescription:   cubit.allSalonsModel.data[index].descriptionAr  ,
                              englishDescription: cubit.allSalonsModel.data[index].descriptionEn,
                              specialitiesList: cubit.allSalonsModel.data[index].specialities
                            );
                          })),
                ],
              );
            }
            return customDefaultShimmerListView(context: context);
          },
        ),
      ),
    ),
  );
}
