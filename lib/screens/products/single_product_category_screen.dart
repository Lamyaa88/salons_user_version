import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/products/widgets/all_products_grid_view.dart';
class SingleCategoryProductScreen extends StatefulWidget {
  @override
  _SingleCategoryProductScreenState createState() => _SingleCategoryProductScreenState();
}
class _SingleCategoryProductScreenState extends State<SingleCategoryProductScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteColor,
      body: CustomBuildBody(
        columnOfWidgets: Column(

          children: [
            Container(
                child: allProductsGridView(context : context )
            ),
          ],
        ),
      ),);
  }
}
