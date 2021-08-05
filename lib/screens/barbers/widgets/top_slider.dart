import 'package:almezyn/utils/file_export.dart';

barbersTopSlider({BuildContext context}) {
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
                        'https://i.pinimg.com/564x/c5/26/91/c52691835f6d576392c0e7d4a6fb1bb7.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/236x/76/86/0f/76860fe35c359564fe44dfaadba10e0a.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/564x/35/7c/47/357c4753e1b37801d311ffb5d8e20453.jpg'),
                    NetworkImage(
                        'https://i.pinimg.com/236x/76/86/0f/76860fe35c359564fe44dfaadba10e0a.jpg'),









                  ],
                ),
              );
            }),
      )
    ],
  );
}
