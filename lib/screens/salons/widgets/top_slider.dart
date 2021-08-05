import 'package:almezyn/utils/file_export.dart';

salonsTopSlider({BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: width(context),
        height: isLandscape(context)
            ? 2 * height(context) * .4
            : height(context) * .4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
//                shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(right: width(context) * .02),
                width: width(context),
                height: isLandscape(context)
                    ? 2 * height(context) * .4
                    : height(context) * .4,
                child: Carousel(
                  dotIncreasedColor: blueColor,
                  borderRadius: false,
                  dotSize: 3.0,
                  showIndicator: true,
                  dotSpacing: 13,
                  onImageTap: (index) {
                    print('this is $index');
                  },
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  boxFit: BoxFit.fill,
                  images: [
                    NetworkImage(
                        'https://i.pinimg.com/236x/39/d5/29/39d529915c11bcec810bd4ea3601d4a8.jpg'),
                    NetworkImage(
                     'https://i.pinimg.com/564x/eb/3b/89/eb3b89fa2c9b6096e0c928d548e0e71d.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/564x/40/02/18/400218b38c97372bbd361f4a732467e7.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/564x/ce/78/cc/ce78cc5df7586e97783006d2a4365d61.jpg'),

                    







                  ],
                ),
              );
            }),
      )
    ],
  );
}
