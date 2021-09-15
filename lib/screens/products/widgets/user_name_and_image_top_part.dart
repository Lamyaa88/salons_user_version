import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

userNameAndImageTopPart({BuildContext context , String username , String imagePath}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return GestureDetector(onTap: (){
  },
    child: Container(
        child:Container(
          padding: EdgeInsets.only(right: width*.05 , left: width*.05),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  customDescriptionTextText(percentageOfHeight: .03 , text:
                  "${translator.translate("Hello")} ${translator.translate(username)}"
                      ,context: context ,
                      textColor: blackColor ,fontWeight: FontWeight.bold),
                  customDescriptionTextText(percentageOfHeight: .03 ,
                      text: translator.translate("Welcome Back !") ,context: context),



                ],),
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child:
                      Neumorphic(
                        child: Container(
                          height:
                          isLandscape(context) ? 2*height*.1: height*.1,width: width*.2,decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)
                            ,image: DecorationImage(image: NetworkImage("${baseImageUrl}${imagePath}"))),
                        ),
                      )),
                ],
              )


            ],),
        )),
  ) ;
}