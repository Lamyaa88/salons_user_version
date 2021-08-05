import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

singleAccountCard({BuildContext context , String title , String subtitle , IconData iconData , Function onTap }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return
      Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(8)),
            depth: 10,
            lightSource: LightSource.topLeft,
            shadowLightColor: Colors.white,
//                        shadowDarkColor: Colors.grey ,
            color: backGroundColor),
        child: GestureDetector(onTap: onTap ,
          child: Container(padding: EdgeInsets.only(right: width*.03 , left: width*.03 ),
            width: width*.43,decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8)


,  ),
           child: Center(

             child: Column(mainAxisSize: MainAxisSize.min,
               children: [
                 responsiveSizedBox(context: context , percentageOfHeight: .02),
                 Row(children: [
               customDescriptionTextText(context: context , text:  translator.translate(title),textAlign: TextAlign.start,
                   textColor: blackColor , fontWeight: FontWeight.bold , percentageOfHeight: .0225),


],),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 customDescriptionTextText(context: context , text:  translator.translate(subtitle)  , percentageOfHeight: .013),
                 Icon( iconData , color: backGroundColor, size: isLandscape(context) ? 2*height*.04:height*.04,),



               ],),
                 responsiveSizedBox(context: context , percentageOfHeight: .02),

             ],),
           ),),
        ),
      )
   ;
}