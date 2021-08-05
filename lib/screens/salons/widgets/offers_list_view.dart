import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_cubit.dart';
import 'package:almezyn/app_cubits/offers/all_offers_cubit/all_offers_state.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

offersListView({BuildContext context}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return    Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container( height: height*.25,
        child:   BlocConsumer<AllOffersCubit , AllOffersStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            var cubit = AllOffersCubit.get(context);

            if (state is! AllOffersLoadingState) {
              return    Container(width: width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:  cubit.allOffersModel.data.length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return customSingleCategoryCard(context: context   ,
                          englishTitle: cubit.allOffersModel.data[index].nameEn,
                          imagePath:cubit.allOffersModel.data[index].image);
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