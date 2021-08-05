


import 'package:almezyn/utils/file_export.dart';
import 'package:shimmer/shimmer.dart';

customPlaceHolder( { BuildContext context , double cardWidth :.2 , double cardHeight : .3 }){
  return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          highlightColor: Theme.of(context).primaryColor.withOpacity(.2) ,
          baseColor: Theme.of(context).primaryColor.withOpacity(.3) ,
          direction: ShimmerDirection.ltr,
          child: Container(
            padding: EdgeInsets.only(right: width(context)*.03 , left: width(context)*.0),
            child:
                Container(
                  color: Colors.white,
                  height: height(context)*cardHeight,
                  width: width(context)*cardWidth,
                ),
          ),
        ) ;
      }) ;
}