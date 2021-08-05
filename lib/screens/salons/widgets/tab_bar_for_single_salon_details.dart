import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

tapBarForSingleSalonDetails({BuildContext context}){
  return       Container(
    child: TabBar(
      indicatorWeight: 3,
//                      enableFeedback: true ,
      indicatorColor: blueColor,
      labelColor: blueColor ,
      unselectedLabelColor: Theme.of(context).hintColor.withOpacity(0.4),
      labelStyle: Theme.of(context).textTheme.subtitle1,
      tabs: [

        Tab(text:translator.translate("Salon")),
        Tab(text:translator.translate("Barbers")),
        Tab(text:translator.translate("Location")),
      ],
    ),
  ) ;
}