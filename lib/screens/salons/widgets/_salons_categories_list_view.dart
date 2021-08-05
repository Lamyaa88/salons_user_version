import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_categories_cubit.dart';
import 'package:almezyn/app_cubits/categories/all_categories_cubit/all_categories_state.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
salonsCategoriesListView({BuildContext context}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return  Row(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: [
      Container(
        height: height * .25,
        child: BlocConsumer<
            AllCategoriesCubit,
            AllCategoriesStates>(
          listener:
              (context, state) => {},
          builder: (context, state) {
            var cubit =
            AllCategoriesCubit
                .get(context);

            if (state
            is! AllCategoriesLoadingState) {
              return Container(
                width: width,
                child:
                ListView.builder(
                    shrinkWrap:
                    true,
                    itemCount: cubit
                        .allCategoriesModel
                        .data
                        .length,
                    scrollDirection:
                    Axis
                        .horizontal,
                    itemBuilder:
                        (context,
                        index) {
                      return customSingleCategoryCard(
                          context:
                          context,
                          englishTitle: cubit
                              .allCategoriesModel
                              .data[
                          index]
                              .nameEn,
                          imagePath: cubit
                              .allCategoriesModel
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