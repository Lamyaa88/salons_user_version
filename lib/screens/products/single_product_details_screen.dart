import 'package:almezyn/app_cubits/products/single_product_cubit/single_product_cubit.dart';
import 'package:almezyn/app_cubits/products/single_product_cubit/single_product_state.dart';
import 'package:almezyn/utils/check_direction.dart';
import 'package:almezyn/utils/constants.dart';
import 'package:almezyn/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SingleProductDetailsScreen extends StatefulWidget {
  final productId;
  SingleProductDetailsScreen({this.productId});
  @override
  _SingleProductDetailsScreenState createState() =>
      _SingleProductDetailsScreenState(productId);
}
class _SingleProductDetailsScreenState
    extends State<SingleProductDetailsScreen> {
  @override
  final productId;
  _SingleProductDetailsScreenState(this.productId);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      child: BlocProvider(
        create: (BuildContext context) =>
            SingleProductCubit()..getSingleProduct(id: productId),
        child: BlocConsumer<SingleProductCubit, SingleProductStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SingleProductCubit.get(context);

            if (state is! SingleProductLoadingState) {
              return Scaffold(
                body: Container(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leading: null,
                          expandedHeight: isLandscape(context)
                              ? 2 * height * .5
                              : height * .5,
                          backgroundColor: whiteColor,
                          floating: false,
                          pinned: false,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              height: isLandscape(context)
                                  ? 2 * height * .3
                                  : height * .3,
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${baseImageUrl}${cubit.singleProductModel.data.image}"),
                                  fit: isLandscape(context)
                                      ? BoxFit.fitHeight
                                      : BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .05),
                          customDescriptionTextText(
                              context: context,
                              textColor: blackColor,
                              text: checkDirection(
                                cubit.singleProductModel.data.nameAr,
                                cubit.singleProductModel.data.nameEn,
                              ),
                              maxLines: 5,
                              fontWeight: FontWeight.bold,
                              percentageOfHeight: .03),

                          responsiveSizedBox(
                              context: context, percentageOfHeight: .01),
                          customDescriptionTextText(
                              context: context,
                              text: checkDirection(
                                cubit.singleProductModel.data.descriptionAr,
                                cubit.singleProductModel.data.descriptionEn,
                              ),
                              percentageOfHeight: .03,
                              maxLines: 5),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .01),

                          customDescriptionTextText(
                              context: context,
                              text: checkDirection(
                                "\$ ${cubit.singleProductModel.data.price}",
                                "\$ ${cubit.singleProductModel.data.price}",
                              ),
                              percentageOfHeight: .03),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
//
                          CustomButton(
                            text: "Add to Cart",
                            onTapButton: () {
                              DioHelper.postData(
                                url:
                                    "/add-to-cart/${cubit.singleProductModel.data.id.toString()}",
                                data: {"qty": "1"},
                                token: token,
                              ).then((value) {
                                print(value.data);
                                if (value.statusCode == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(value.data["message"])));
                                }
                              });
                            },
                          ),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
                          CustomButton(
                            buttonColor: Colors.grey.withOpacity(.6),
                            text: "save product",
                            onTapButton: () {
                              DioHelper.postData(
                                url: "/store-save",
                                data: {
                                  "item_id": cubit.singleProductModel.data.id
                                      .toString(),
                                  "type": "product"
                                },
                                token: token,
                              ).then((value) {
                                print(value.data);
                                if (value.statusCode == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(value.data["message"])));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return spinKit;
          },
        ),
      ),
    );
  }}
