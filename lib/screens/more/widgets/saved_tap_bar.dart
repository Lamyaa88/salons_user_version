import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

savedTapBar({BuildContext context }){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: TabBar(
        tabs: [
          Tab(
            child:customDescriptionTextText(context: context , text: "Salons" , percentageOfHeight: .025) ,


          ),
          Tab(
              child:customDescriptionTextText(context: context , text: "Barbers" , percentageOfHeight: .025)
          ),
          Tab(
              child:customDescriptionTextText(context: context , text: "Products" , percentageOfHeight: .025)
          ),
        ],
        indicatorColor:blueColor ,
      labelColor: blueColor,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
  );
}