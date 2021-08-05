import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedMedicines extends StatefulWidget {
  @override
  _SavedMedicinesState createState() => _SavedMedicinesState();
}

class MedicineInfo {
  String image;
  String name;
  String price;
  bool prescription;

  MedicineInfo(this.image, this.name, this.price, this.prescription);
}

class _SavedMedicinesState extends State<SavedMedicines> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    List<MedicineInfo> _myItems = [
      MedicineInfo(
          'assets/barbersImages/p1.png', "product name ", '3.50', true),
      MedicineInfo(
          'assets/barbersImages/p2.jpg', 'product name ', '3.00', false),
      MedicineInfo('assets/barbersImages/p15.jpg', 'product name ',
          '4.00', false),
      MedicineInfo(
          'assets/barbersImages/p3.jpg', 'product name t', '3.50', true),
      MedicineInfo(
          'assets/barbersImages/p4.jpg', 'product name ', '3.50', false),
      MedicineInfo(
          'assets/barbersImages/p1.png', 'product name ', '3.50', true),
      MedicineInfo(
          'assets/barbersImages/p13.jpg', 'product name ', '3.50', true),
      MedicineInfo(
          'assets/barbersImages/p7.jpg', 'product name ', '3.00', false),
      MedicineInfo(  'assets/barbersImages/p15.jpg', 'product name ',
          '4.00', false),
      MedicineInfo(
          'assets/barbersImages/p8.jpg', 'product name ', '3.50', true),
      MedicineInfo(
          'assets/barbersImages/p16.jpg', 'product name ', '3.50', false),
      MedicineInfo(
          'assets/barbersImages/p10.jpg', 'product name ', '3.50', true),
    ];
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          color: Theme.of(context).backgroundColor,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount:20 ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.82,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: Stack(
                    children: [
                      Container(
// margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              children: [

                                Image.network(

                                      "https://www.historicconsultants.com/wp-content/uploads/placeholder3.png",

                                  fit: BoxFit.fitHeight,height: height*.15 ,
                                ),
//                                        Image.asset(_myItems[index].image ,fit: BoxFit.fitHeight,height: height*.15,),
                                _myItems[index].prescription
                                    ? Align(
                                  alignment: Alignment.topRight,
//                                          child: Image.asset(
//                                            'assets/ic_prescription.png',
//                                            scale: 3,
//                                          ),
                                )
                                    : SizedBox.shrink(),
                              ],
                            ),
                            Spacer(),
                            Text("name"),

                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  '\$ ' "50" ,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child:  GestureDetector(
                          onTap: () {

                            DioHelper.postData(
                              url: "/add-to-cart/${5}",
                              data: {"qty": "1"},
                              token: token,
                            ).then((value) {
                              final response = value.data;
                              print(
                                  "response for adding item to cart is  ${response}");
                              print(
                                  "status code for adding item to cart  is  ${value.statusCode}");
                              if (value.statusCode == (200 ) &&
                                  value.data['message'] ==
                                      "this item is already in your cart list") {
                                print(
                                    " now show a message telling  the user that the product is  already in his cart");
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "this item is already in your cart list"),
                                ));
                              } else if (value.statusCode == ( 200 ) &&
                                  value.data['message'] ==
                                      null ) {
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Item added to your cart successfully "),
                                ));
                              }
                            });

//                    Navigator.pushNamed(context, PageRoutes.myCartPage);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                              color: Theme.of(context).primaryColor,
                            ),
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                );
              })

      ),
    );
  }
}