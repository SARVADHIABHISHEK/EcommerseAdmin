// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:ecommerse_admin/menu_bar.dart' as _i1;
import 'package:ecommerse_admin/src/admin/view/category/category_screen.dart'
    as _i8;
import 'package:ecommerse_admin/src/admin/view/category/sub_category.dart'
    as _i9;
import 'package:ecommerse_admin/src/admin/view/coupon/coupons_screen.dart'
    as _i12;
import 'package:ecommerse_admin/src/admin/view/customer/customer_screen.dart'
    as _i15;
import 'package:ecommerse_admin/src/admin/view/e_commerce_dashboard/e_commerce_dashboard_screen.dart'
    as _i7;
import 'package:ecommerse_admin/src/admin/view/order/order_invoice.dart' as _i2;
import 'package:ecommerse_admin/src/admin/view/order/order_screen.dart' as _i3;
import 'package:ecommerse_admin/src/admin/view/products/product_add.dart'
    as _i6;
import 'package:ecommerse_admin/src/admin/view/products/product_detail_screen.dart'
    as _i4;
import 'package:ecommerse_admin/src/admin/view/products/products_screen.dart'
    as _i5;
import 'package:ecommerse_admin/src/admin/view/return_condition/return_condition_screen.dart'
    as _i14;
import 'package:ecommerse_admin/src/admin/view/return_order/return_order_invoice.dart'
    as _i11;
import 'package:ecommerse_admin/src/admin/view/return_order/return_order_screen.dart'
    as _i10;
import 'package:ecommerse_admin/src/admin/view/subscription/subscription_screen.dart'
    as _i13;
import 'package:ecommerse_admin/src/admin/view/vender/vender_detail_screen.dart'
    as _i17;
import 'package:ecommerse_admin/src/admin/view/vender/vender_screen.dart'
    as _i16;
import 'package:ecommerse_admin/src/charts/chartist.dart' as _i20;
import 'package:ecommerse_admin/src/charts/chartjs.dart' as _i19;
import 'package:ecommerse_admin/src/charts/morris_chart.dart' as _i18;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    EcommerseAdminSideBar.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EcommerseAdminSideBar(),
      );
    },
    OrderInvoice.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.OrderInvoice(),
      );
    },
    OrderScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OrderScreen(),
      );
    },
    ProductDetailScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProductDetailScreen(),
      );
    },
    ProductsScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProductsScreen(),
      );
    },
    ProductAdd.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProductAdd(),
      );
    },
    EcommerceDashboard.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EcommerceDashboard(),
      );
    },
    CategoryScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CategoryScreen(),
      );
    },
    SubCategoryScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SubCategoryScreen(),
      );
    },
    ReturnOrderScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ReturnOrderScreen(),
      );
    },
    ReturnOrderInvoice.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ReturnOrderInvoice(),
      );
    },
    CouponsScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CouponsScreen(),
      );
    },
    SubScriptionScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SubScriptionScreen(),
      );
    },
    ReturnConditionScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ReturnConditionScreen(),
      );
    },
    CustomerScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.CustomerScreen(),
      );
    },
    VenderScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.VenderScreen(),
      );
    },
    VenderDetailScreen.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.VenderDetailScreen(),
      );
    },
    MorrisChart.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.MorrisChart(),
      );
    },
    ChartJsChart.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ChartJsChart(),
      );
    },
    ChartListChart.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ChartListChart(),
      );
    },
  };
}

/// generated route for
/// [_i1.EcommerseAdminSideBar]
class EcommerseAdminSideBar extends _i21.PageRouteInfo<void> {
  const EcommerseAdminSideBar({List<_i21.PageRouteInfo>? children})
      : super(
          EcommerseAdminSideBar.name,
          initialChildren: children,
        );

  static const String name = 'EcommerseAdminSideBar';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OrderInvoice]
class OrderInvoice extends _i21.PageRouteInfo<void> {
  const OrderInvoice({List<_i21.PageRouteInfo>? children})
      : super(
          OrderInvoice.name,
          initialChildren: children,
        );

  static const String name = 'OrderInvoice';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OrderScreen]
class OrderScreen extends _i21.PageRouteInfo<void> {
  const OrderScreen({List<_i21.PageRouteInfo>? children})
      : super(
          OrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'OrderScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProductDetailScreen]
class ProductDetailScreen extends _i21.PageRouteInfo<void> {
  const ProductDetailScreen({List<_i21.PageRouteInfo>? children})
      : super(
          ProductDetailScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProductsScreen]
class ProductsScreen extends _i21.PageRouteInfo<void> {
  const ProductsScreen({List<_i21.PageRouteInfo>? children})
      : super(
          ProductsScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProductsScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProductAdd]
class ProductAdd extends _i21.PageRouteInfo<void> {
  const ProductAdd({List<_i21.PageRouteInfo>? children})
      : super(
          ProductAdd.name,
          initialChildren: children,
        );

  static const String name = 'ProductAdd';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EcommerceDashboard]
class EcommerceDashboard extends _i21.PageRouteInfo<void> {
  const EcommerceDashboard({List<_i21.PageRouteInfo>? children})
      : super(
          EcommerceDashboard.name,
          initialChildren: children,
        );

  static const String name = 'EcommerceDashboard';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CategoryScreen]
class CategoryScreen extends _i21.PageRouteInfo<void> {
  const CategoryScreen({List<_i21.PageRouteInfo>? children})
      : super(
          CategoryScreen.name,
          initialChildren: children,
        );

  static const String name = 'CategoryScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SubCategoryScreen]
class SubCategoryScreen extends _i21.PageRouteInfo<void> {
  const SubCategoryScreen({List<_i21.PageRouteInfo>? children})
      : super(
          SubCategoryScreen.name,
          initialChildren: children,
        );

  static const String name = 'SubCategoryScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ReturnOrderScreen]
class ReturnOrderScreen extends _i21.PageRouteInfo<void> {
  const ReturnOrderScreen({List<_i21.PageRouteInfo>? children})
      : super(
          ReturnOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'ReturnOrderScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ReturnOrderInvoice]
class ReturnOrderInvoice extends _i21.PageRouteInfo<void> {
  const ReturnOrderInvoice({List<_i21.PageRouteInfo>? children})
      : super(
          ReturnOrderInvoice.name,
          initialChildren: children,
        );

  static const String name = 'ReturnOrderInvoice';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CouponsScreen]
class CouponsScreen extends _i21.PageRouteInfo<void> {
  const CouponsScreen({List<_i21.PageRouteInfo>? children})
      : super(
          CouponsScreen.name,
          initialChildren: children,
        );

  static const String name = 'CouponsScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SubScriptionScreen]
class SubScriptionScreen extends _i21.PageRouteInfo<void> {
  const SubScriptionScreen({List<_i21.PageRouteInfo>? children})
      : super(
          SubScriptionScreen.name,
          initialChildren: children,
        );

  static const String name = 'SubScriptionScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ReturnConditionScreen]
class ReturnConditionScreen extends _i21.PageRouteInfo<void> {
  const ReturnConditionScreen({List<_i21.PageRouteInfo>? children})
      : super(
          ReturnConditionScreen.name,
          initialChildren: children,
        );

  static const String name = 'ReturnConditionScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CustomerScreen]
class CustomerScreen extends _i21.PageRouteInfo<void> {
  const CustomerScreen({List<_i21.PageRouteInfo>? children})
      : super(
          CustomerScreen.name,
          initialChildren: children,
        );

  static const String name = 'CustomerScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.VenderScreen]
class VenderScreen extends _i21.PageRouteInfo<void> {
  const VenderScreen({List<_i21.PageRouteInfo>? children})
      : super(
          VenderScreen.name,
          initialChildren: children,
        );

  static const String name = 'VenderScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i17.VenderDetailScreen]
class VenderDetailScreen extends _i21.PageRouteInfo<void> {
  const VenderDetailScreen({List<_i21.PageRouteInfo>? children})
      : super(
          VenderDetailScreen.name,
          initialChildren: children,
        );

  static const String name = 'VenderDetailScreen';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MorrisChart]
class MorrisChart extends _i21.PageRouteInfo<void> {
  const MorrisChart({List<_i21.PageRouteInfo>? children})
      : super(
          MorrisChart.name,
          initialChildren: children,
        );

  static const String name = 'MorrisChart';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ChartJsChart]
class ChartJsChart extends _i21.PageRouteInfo<void> {
  const ChartJsChart({List<_i21.PageRouteInfo>? children})
      : super(
          ChartJsChart.name,
          initialChildren: children,
        );

  static const String name = 'ChartJsChart';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ChartListChart]
class ChartListChart extends _i21.PageRouteInfo<void> {
  const ChartListChart({List<_i21.PageRouteInfo>? children})
      : super(
          ChartListChart.name,
          initialChildren: children,
        );

  static const String name = 'ChartListChart';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}
