
import 'package:almezyn/utils/file_export.dart';
 singleTabButton({BuildContext context , bool isThisButtonActive : false  , Function onTapButton  , String buttonText }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return GestureDetector(onTap: onTapButton,
    child: Container(width: width*.27,height: height*.06,decoration: BoxDecoration(
        border: Border.all(color: isThisButtonActive == true ? blueColor : greyColor , width: 2 )
        , borderRadius: BorderRadius.circular(8)
    ),child: Center(child: customDescriptionTextText(context: context , text: buttonText ,
        textColor: isThisButtonActive == true ? blueColor :  greyColor.withOpacity(.5) , fontWeight: FontWeight.bold),),),
  );
}
