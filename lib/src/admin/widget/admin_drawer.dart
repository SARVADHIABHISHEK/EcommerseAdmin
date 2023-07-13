import 'package:auto_route/auto_route.dart';
import 'package:ecommerse_admin/src/admin/constant/allconst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutterx/flutterx.dart';

class EcommerseAdminDrawer extends StatefulWidget {
  const EcommerseAdminDrawer({
    super.key,
    required this.tabsRouter,
    this.onPressed,
  });

  final TabsRouter tabsRouter;
  final void Function()? onPressed;

  @override
  State<EcommerseAdminDrawer> createState() => _EcommerseAdminDrawerState();
}

class _EcommerseAdminDrawerState extends State<EcommerseAdminDrawer>
    with TickerProviderStateMixin {
  // late TabController _tabController;

  final List<String> _ecommerseAdmin = [
    'Dashboard',
    'Product Add',
    'Barnd Add',
    Strings.category,
    Strings.vendor,
    Strings.customer,
    Strings.order,
    Strings.returnOrder,
    Strings.subscriber,
    Strings.coupons,
    Strings.returnCondition,
  ];

  // final List<Widget> _tabs = [
  //   const Tab(
  //       child: CustomText(
  //     title: 'University',
  //     fontSize: 16.0,
  //   )),
  //   const Tab(
  //       child: CustomText(
  //     title: 'Admin',
  //     fontSize: 16.0,
  //   )),
  // ];

  // @override
  // void initState() {
  //   _tabController = TabController(length: _tabs.length, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 178, 174, 1),
              Color.fromRGBO(35, 165, 181, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            FxBox.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconlyBroken.adminKit,
                  height: 30,
                ),
                FxBox.w10,
                const Text(
                  'Ecommerse AdminKit',
                  style: TextStyle(
                      color: ColorConst.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                )
              ],
            ),
            FxBox.h24,
            _adminEcommerse(widget.tabsRouter),
          ],
        ),
      ),
    );
  }

  Widget _adminEcommerse(TabsRouter tabsRouter) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: _ecommerseAdmin.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            _ecommerseAdmin[index],
            style: TextStyle(
              color: ColorConst.white,
              fontSize: 16.0,
              fontWeight: index == tabsRouter.activeIndex
                  ? FontWeight.bold
                  : FontWeight.w500,
            ),
          ),
          onTap: () {
            tabsRouter.setActiveIndex(index);
          },
        );
      },
      separatorBuilder: (context, index) {
        return FxBox.h12;
      },
    );
  }
}
