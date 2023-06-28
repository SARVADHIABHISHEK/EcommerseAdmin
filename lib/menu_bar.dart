import 'package:ecommerse_admin/src/admin/constant/color.dart';
import 'package:ecommerse_admin/src/admin/constant/custom_text.dart';
import 'package:ecommerse_admin/src/admin/constant/image.dart';
import 'package:ecommerse_admin/src/admin/constant/string.dart';
import 'package:ecommerse_admin/src/admin/constant/text.dart';
import 'package:ecommerse_admin/src/admin/utils/adminResponsive.dart';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerse_admin/src/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:url_launcher/url_launcher.dart';

import 'src/admin/widget/admin_drawer.dart';

@RoutePage()
class EcommerseAdminSideBar extends StatefulWidget {
  const EcommerseAdminSideBar({super.key});

  @override
  State<EcommerseAdminSideBar> createState() => _EcommerseAdminSideBarState();
}

class _EcommerseAdminSideBarState extends State<EcommerseAdminSideBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<PageRouteInfo<dynamic>> routes = [
    const EcommerceDashboard(),
    const ProductAdd(),
    const CategoryScreen(),
    const VenderScreen(),
    const CustomerScreen(),
    const OrderScreen(),
    const ReturnOrderScreen(),
    const SubScriptionScreen(),
    const CouponsScreen(),
    const ReturnConditionScreen(),
  ];
  final List<Map<String, dynamic>> _items = [
    {
      'icon': Icons.person_2_outlined,
      'name': Strings.profile,
    },
    {
      'icon': Icons.settings,
      'name': Strings.setting,
    },
    {
      'icon': Icons.mail,
      'name': Strings.inbox,
    },
    {
      'icon': Icons.send,
      'name': Strings.message,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          key: _scaffoldKey,
          drawer: EcommerseAdminDrawer(
            tabsRouter: tabsRouter,
            onPressed: () {
              if (!UniversityResponsive.isLargeWeb(context)) {
                _scaffoldKey.currentState?.openEndDrawer();
              }
            },
          ),
          // endDrawer: const EndDrawer(),
          body: Row(
            children: [
              if (UniversityResponsive.isLargeWeb(context) ||
                  UniversityResponsive.isMediumWeb(context))
                EcommerseAdminDrawer(tabsRouter: tabsRouter),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: 80,
                    backgroundColor: ColorConst.white,
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    leading: UniversityResponsive.isLargeWeb(context) ||
                            UniversityResponsive.isMediumWeb(context)
                        ? null
                        : IconButton(
                            onPressed: () =>
                                _scaffoldKey.currentState?.openDrawer(),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            )),
                    titleSpacing: 24.0,
                    title: UniversityResponsive.isMobile(context) ||
                            UniversityResponsive.isTablet(context)
                        ? const SizedBox.shrink()
                        : ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 500.0),
                            child: TextField(
                              cursorWidth: 1,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                hintText: Strings.searchText,
                                suffixIcon: Container(
                                  width: 70,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.0),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: CustomText(
                                    title: Strings.search,
                                    fontSize: 16.0,
                                    textColor: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: _buyNow(),
                      ),
                      FxBox.w4,
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 22.0),
                      //   child: _goBackButton(),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mail,
                            color: ColorConst.black,
                            size: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: ColorConst.black,
                            size: 20.0,
                          ),
                        ),
                      ),
                      FxBox.w4,
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: _profile(tabsRouter),
                      ),
                      FxBox.w20,
                      // SizedBox(width: 30, height: 20, child: _buyNow())
                    ],
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: child),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 18.0),
                        child: CustomText(
                          title: '© 2022 Admin. Crafted with ❤️ by Sarvadhi',
                          textColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (UniversityResponsive.isLargeWeb(context)) ...[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 0.5,
                  color: ColorConst.grey200,
                ),
                // const SizedBox(
                //   width: 320,
                //   child: EndDrawer(),
                // ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _profile(TabsRouter tabsRouter) {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: Chip(
        padding: EdgeInsets.zero,
        labelPadding:
            const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        avatar: const CircleAvatar(
          maxRadius: 16,
          backgroundImage: AssetImage(Images.profileImage),
        ),
        label: Container(
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              )),
          child: const CustomText(
            title: 'Jems',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      customItemsHeight: 8,
      onChanged: (value) {},
      items: [
        ..._items.map(
          (e) => DropdownMenuItem(
            value: e,
            child: ListTile(
                horizontalTitleGap: 0.0,
                leading: Icon(
                  e['icon'],
                  size: 18.0,
                ),
                title: Text(
                  e['name'],
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: e['name'] == "Inbox"
                    ? Container(
                        height: 16.0,
                        width: 16.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorConst.blue,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: const CustomText(
                          title: '6',
                          fontSize: 12.0,
                          textColor: ColorConst.white,
                        ),
                      )
                    : null),
          ),
        ),
        const DropdownMenuItem<Divider>(
          enabled: false,
          child: Divider(color: ColorConst.lightGrey),
        ),
        const DropdownMenuItem(
          value: 'Need Help',
          child: ListTile(
            horizontalTitleGap: 0.0,
            leading: Icon(
              Icons.help_outline_outlined,
              size: 18.0,
            ),
            title: Text(
              Strings.needhelp,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const DropdownMenuItem(
          value: 'Sign out',
          child: ListTile(
            horizontalTitleGap: 0.0,
            leading: Icon(
              Icons.logout,
              size: 18.0,
            ),
            title: Text(
              'SignOut',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      itemHeight: 38,
      itemPadding: const EdgeInsets.only(left: 16, right: 16),
      dropdownWidth: 200,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 10),
          ]),
      dropdownElevation: 0,
      offset: const Offset(-108, 10),
    );
  }

  Widget _buyNow() {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: ColorConst.primary,
      onPressed: () async {
        const url = Strings.buyNowUrl;
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not Launch U';
        }
      },
      child: ConstText.largeText(
        text: "BuyNow",
        fontSize: 16,
        color: ColorConst.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // Widget _goBackButton() {
  //   return MaterialButton(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //     color: ColorConst.primary,
  //     onPressed: () {
  //       context.router.push(const FMenuBar());
  //     },
  //     child: ConstText.largeText(
  //       text: Strings.badge,
  //       fontSize: 16,
  //       color: ColorConst.white,
  //       fontWeight: FontWeight.w500,
  //     ),
  //   );
  // }
}
