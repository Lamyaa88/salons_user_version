import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezyn/app_cubits/specifications/all_categories_cubit/all_specifications_cubit.dart';
import 'package:almezyn/app_cubits/specifications/all_categories_cubit/all_specificationss_state.dart';
specificationListView({BuildContext context}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return    Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container( height: height*.25,
        child:   BlocConsumer<AllSpecificationsCubit, AllSpecificationsStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            var cubit = AllSpecificationsCubit.get(context);

            if (state is! AllSpecificationsLoadingState) {
              return    Container(width: width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:  cubit.allSpecificationsModel.data.length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return customSingleCategoryCard(context: context   ,
                          englishTitle: cubit.allSpecificationsModel.data[index].nameEn,
                          imagePath:cubit.allSpecificationsModel.data[index].image);
                    }),
              );

            }
            return   Container(width: width,
              child: ListView.builder(

                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return customSingleCategoryCard(context: context   , isShimmer: true ,
                        englishTitle:"" ,
                        imagePath:"");
                  }),
            );

          },
        ),
      )
    ],
  ) ;
}