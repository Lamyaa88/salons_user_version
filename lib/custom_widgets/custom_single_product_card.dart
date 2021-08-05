import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';

customSingleProductCard(
    {BuildContext context,
      String imagePath,
      Function onTapAdd ,
      Function onTapCard,
      Function onTap ,
      bool isPlaceHolder: false,
      String englishName: "",
      String arabicName: "",
      String englishDescription : "",
      String arabicDescription : "",
      String arabicPrice: "",
      String englishPrice: "",
      int productQuantity : 1 ,
      bool isShimmer: false}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return GestureDetector( onTap: onTap,
    child: Row(
      children: [
        Container(height: isLandscape(
            context)
            ? 2 * height * .25
            : height * .25,),
        Stack(children: [

             Neumorphic(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          imagePath == null
                              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd2Kh8L2EGOPt5wXNJPeu0V9V4_UjOEXKL6W9hXWKzBlK7d8HzgVTTm7G-XQQDqJ7REsg&usqp=CAU"
                              : imagePath),
                      fit: BoxFit.cover,
                    ),
             ),
                height: isLandscape(context)
                    ? 2 * height * .25
                    : height * .25,
                width: width * .44,
              ),
            ),
            Container(padding: EdgeInsets.only(right: width*.02,left: width*.02),alignment: Alignment.bottomCenter,
              height: isLandscape(context)
                  ? 2 * height * .25
                  : height * .25,
              width: width * .44,
           color: blueColor.withOpacity(.2),
            ),
          Container(padding: EdgeInsets.only(right: width*.02,left: width*.02),alignment: Alignment.bottomCenter,
            height: isLandscape(context)
                ? 2 * height * .25
                : height * .25,
            width: width * .44,
            child: Column(mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  customDescriptionTextText(context: context ,text: "Product name " ,textColor: whiteColor ,percentageOfHeight: .022,
                      fontWeight: FontWeight.bold ,textAlign: TextAlign.start)

                ],),
                Row(children: [
                  customDescriptionTextText(context: context ,text: "\$ 50" ,textColor: whiteColor ,percentageOfHeight: .025,
                      fontWeight: FontWeight.bold ,textAlign: TextAlign.start)

                ],),

              ],),
          ),
          Container(alignment: checkDirection(Alignment.topLeft,Alignment.topRight),
            height: isLandscape(context)
                ? 2 * height * .25
                : height * .25,
              width: width * .44,

            child: GestureDetector(onTap: onTapAdd,
              child: Neumorphic(
                child: Container( height: isLandscape(context)
                    ? 2 * height * .06
                    : height * .06,
                  width: width * .12, decoration:
                  BoxDecoration(color: blueColor),child: Center(child: Icon(Icons.add ,color: whiteColor,),),),
              ),
            )
          ),

        ],)
      ],
    ),
  );
}

