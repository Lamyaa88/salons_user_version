
import 'package:almezyn/app_cubits/salons/all_salons_cubit/all_salons_cubit.dart';
import 'package:almezyn/screens/salons/widgets/all_salons_list_view.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleSalonCategoryScreen  extends StatelessWidget {
  final category ;
  SingleSalonCategoryScreen({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            responsiveSizedBox(context: context , percentageOfHeight: .03),
            Container(height: height(context)*.1,
              child: Row(children: [
                SizedBox(width: width(context)*.05,) ,
                GestureDetector(onTap: (){Navigator.of(context).pop();},
                  child: Icon(Icons.arrow_back , color: blackColor,size: height(context)*.05,),),
                SizedBox(width: width(context)*.05,) ,
                customDescriptionTextText(context: context , text: category , fontWeight: FontWeight.bold , percentageOfHeight: .025, textColor: blackColor)
              ],),),
            Container(height: height(context)*.9,

              child: BlocProvider(
                  create: (BuildContext context) => AllSalonsCubit()..getAllSalons(),
                  child: allSalonsListView2(context: context)

              ),),
          ],
        ),
      ),
    );
  }
}
