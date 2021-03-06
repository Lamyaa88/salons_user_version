import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/products/widgets/all_products_grid_view.dart';
class SingleCategoryProductScreen extends StatefulWidget {
  final category ;
  SingleCategoryProductScreen(this.category);
  @override
  _SingleCategoryProductScreenState createState() =>
      _SingleCategoryProductScreenState(category);
}
class _SingleCategoryProductScreenState extends State<SingleCategoryProductScreen> {
  final category ;
  _SingleCategoryProductScreenState(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteColor,
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
            Container( height: height(context)*.9,
                child: allProductsGridView(context : context )
            ),
          ],
        ),
      ),);
  }
}
