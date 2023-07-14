import 'package:auto_route/auto_route.dart';
import 'package:ecommerse_admin/src/admin/constant/image.dart';
import 'package:ecommerse_admin/src/admin/utils/responsive.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BannerView extends StatefulWidget {
  const BannerView({super.key});

  @override
  State<BannerView> createState() => _BannerViewState();
}

List<String> _bannerImage = [];

class _BannerViewState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _dataItem(),
      ),
    );
  }

  final List<String> _imageList = [
    Images.offersImage,
    Images.blackDress4,
    Images.offersImage1,
    Images.offersImage1,
  ];

  Widget _dataItem() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.sizeOf(context).height,
      child: GridView.builder(
        gridDelegate: Responsive.isMobile(context)
            ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              )
            : MediaQuery.of(context).size.width < 1500
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  )
                : SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.24,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
        itemCount: _imageList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: Row(children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image.asset(
                      _imageList[index],
                      height: 400,
                    ),
                    Positioned(
                      right: 0,
                      top: 60,
                      child: CloseButton(
                        onPressed: () {
                          _imageList.removeAt(index);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );

          // return _dataOfEcommerce(
          //   name: _typeOfData[index]['type'],
          //   decidedColor: _typeOfData[index]['color'],
          //   number: _typeOfData[index]['number'],
          //   typeOfData: index,
          // );
        },
      ),
    );
  }
}
