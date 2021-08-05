import 'package:almezyn/utils/file_export.dart';

customDefaultPlaceHolderListView({BuildContext context}){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return   Container(
    width: width * .9,
    child: Row(
      children: [
        Container(
          width: width * .3,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
//                              ------------------------- image
              Neumorphic(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.place_holder ,
                          ),fit: BoxFit.cover),
                      borderRadius:
                      BorderRadius.all(
                          Radius.circular(
                              8)),
                      color: backGroundColor),
                  height: isLandscape(context)
                      ? 2 * height * .15
                      : height * .15,
                  width: width * .3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * .03,
        ),
        Container(
          height: isLandscape(context)
              ? 2 * height * .15
              : height * .15,

          width: width * .57,
          child: Container(child: customDescriptionTextText(context: context , text:
          "there is proplem in loading data , Please check your conection and try again " ,
              textAlign: TextAlign.start ,maxLines: 5 , percentageOfHeight: .025),),
        ),
      ],
    ),
  ) ;
}