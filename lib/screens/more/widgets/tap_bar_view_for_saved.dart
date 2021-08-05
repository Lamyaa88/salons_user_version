import 'package:almezyn/custom_widgets/custom_saved_product_card.dart';
import 'package:almezyn/custom_widgets/custom_single_salon_card.dart';
import 'package:almezyn/screens/more/widgets/saved_salons_tab.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:almezyn/screens/products/widgets/saved_products_grid_view.dart';

tapBarViewForSaved({BuildContext context}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return TabBarView(
    children: [
      savedSalonsTab(context :context) ,
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .03,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return customSingleBarberCardCard(context: context
                      ,arabicName: "محمد احمد " , englishName: "Mohammed Ahmed",arabicSpecification: "قص الشعر",englishSpecification: "Hair Cut",
                      specialitiesLength: 10,isCardForSaved: true,arabicFees: " \$ 50", englishFees: " \ 50",onTapCard: (){},

                      imagePath:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSqEFTzhbCzNO_A6omZxnhpm0RtNXvjqeXCg&usqp=CAU" );
                }),
          ],
        ),
      ),


      savedProductsGridView(context : context)
    ],
  );
}
