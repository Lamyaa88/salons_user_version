import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/products/widgets/all_products_grid_view.dart';
class AllProductsScreen extends StatefulWidget {
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}
class _AllProductsScreenState extends State<AllProductsScreen> {

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
