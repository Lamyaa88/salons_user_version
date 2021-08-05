import 'package:almezyn/utils/file_export.dart';

productsTopSlider({BuildContext context}) {
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
                        'https://i.pinimg.com/564x/44/19/96/441996017eefd188e1f1afa6a8710199.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/564x/2f/2f/05/2f2f05453bc0431ff33c95182d122f0f.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/564x/63/a4/65/63a465a5ce1d1195d76f0d97a6e5d1b1.jpg'),

                    NetworkImage(
                        'https://i.pinimg.com/564x/d6/72/cf/d672cf1b0f2f87bc6ff74acb917ca053.jpg'),

                    







                  ],
                ),
              );
            }),
      )
    ],
  );
}
