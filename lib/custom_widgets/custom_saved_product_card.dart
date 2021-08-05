import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/file_export.dart';

customSavedProductCard(
    {BuildContext context,
      String imagePath,
      Function onTapCard,
      bool isPlaceHolder: false,
      String englishName: "",
      String arabicName: "",
      String englishDescription : "",
      String arabicDescription : "",
      String arabicPrice: "",
      String englishPrice: "",
      int productQuantity : 1 ,
      Function onTapIncrease ,
      Function onTapDecrease ,
      Function onTapDeleteItem ,
      bool isShimmer: false}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Row(
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
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcheOpHlet8Nxjjmav2Y5BKOsykJfwByasug&usqp=CAU"
                        : imagePath),
                fit: BoxFit.cover,
              ),
            ),
            height: isLandscape(context)
                ? 2 * height * .25
                : height * .25,
            width: width * .41,
          ),
        ),

        Container(padding: EdgeInsets.only(right: width*.02,left: width*.02),alignment: Alignment.bottomCenter,
          height: isLandscape(context)
              ? 2 * height * .25
              : height * .25,
          width: width * .41,
          color: blueColor.withOpacity(.2),
        ),
        Container(padding: EdgeInsets.only(right: width*.02,left: width*.02),alignment: Alignment.bottomCenter,
          height: isLandscape(context)
              ? 2 * height * .25
              : height * .25,
          width: width * .41,
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
               Container(width: width*.36,child:  customDescriptionTextText(context: context ,text: checkDirection(arabicName, englishName),textColor: whiteColor ,percentageOfHeight: .022,
                   fontWeight: FontWeight.bold ,textAlign: TextAlign.start),)

              ],),


              Row(children: [
                Container(width: width*.37,child: customDescriptionTextText(context: context ,text: checkDirection(arabicDescription, englishDescription),textColor: whiteColor ,percentageOfHeight: .022,
                    fontWeight: FontWeight.bold ,textAlign: TextAlign.start),)

              ],),
              Row(children: [
                Container(child: customDescriptionTextText(context: context ,text:checkDirection(arabicPrice, englishPrice) ,textColor: whiteColor ,percentageOfHeight: .025,
                    fontWeight: FontWeight.bold ,textAlign: TextAlign.start),width: width*.37,)

              ],),

            ],),
        ),
        Container(alignment: checkDirection(Alignment.topLeft,Alignment.topRight),
            height: isLandscape(context)
                ? 2 * height * .25
                : height * .25,
            width: width * .41,

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: onTapIncrease,
                    child: Container(
                      height: isLandscape(
                          context)
                          ? 2 * height * .05
                          : height * .05,width: width*.12,
                      color: blueColor,
                      child: Icon(Icons.add, color:whiteColor
                        ,size: isLandscape(
                            context)
                            ? 2 * height * .04
                            : height * .04,),
                    ),
                  ),
                GestureDetector(onTap: (){},
                  child:Container(
                    child: Container( height: isLandscape(context)
                        ? 2 * height * .04
                        : height * .04,
                      width: width * .1,child:
                      Center(child:Icon(Icons.delete_outline ,color: Colors.red.shade900,)),),),
                ),

              ],
            )
            )


      ],)
    ],
  );
}

