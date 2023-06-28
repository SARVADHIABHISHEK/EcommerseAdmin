import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: EcommerceDashboard.page,
      children: [
        AutoRoute(path: 'AdminDashboard', page: EcommerceDashboard.page),
        AutoRoute(path: 'products', page: ProductsScreen.page),
        AutoRoute(path: 'products/products-detail', page: ProductDetailScreen.page),
        AutoRoute(path: 'category', page: CategoryScreen.page),
        AutoRoute(path: 'category/sub-category', page: SubCategoryScreen.page),
        AutoRoute(path: 'vendor', page: VenderScreen.page),
        AutoRoute(path: 'vendor/vendor-detail', page: VenderDetailScreen.page),
        AutoRoute(path: 'customer', page: CustomerScreen.page),
        AutoRoute(path: 'return-order', page: ReturnOrderScreen.page),
        AutoRoute(path: 'order', page: OrderScreen.page),
        AutoRoute( path: 'return-order/return-order-invoice',page: ReturnOrderInvoice.page),
        AutoRoute(path: 'order/order-invoice', page: OrderInvoice.page),
        AutoRoute(path: 'subscribers', page: SubScriptionScreen.page),
        AutoRoute(path: 'coupons', page: CouponsScreen.page),
        AutoRoute(path: 'return-condition', page: ReturnConditionScreen.page),
      ],
    ),
  ];
}
