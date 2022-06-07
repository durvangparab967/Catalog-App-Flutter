import 'package:flutter/material.dart';
import 'package:flutter_app1/core/store.dart';
import 'package:flutter_app1/pages/Home_page.dart';
import 'package:flutter_app1/pages/Login_page.dart';
import 'package:flutter_app1/pages/cart_page.dart';
import 'package:flutter_app1/pages/home_detail_page.dart';
import 'package:flutter_app1/utils/routes.dart';
import 'package:flutter_app1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.homeDetailsRoute: (uri, _) {
          final catalog = (VxState.store as MyStore)
              .catalog
              .getById(int.parse(uri.queryParameters["id"]!));
          return MaterialPage(
            child: HomeDetailPage(
              catalog: catalog,
            ),
          );
        },
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
      }),
      // initialRoute: MyRoutes.homeRoute,
      // routes: {
      // "/": (context) => LoginPage(),
      // MyRoutes.homeRoute: (context) => HomePage(),
      // MyRoutes.loginRoute: (context) => LoginPage(),
      // MyRoutes.cartRoute: (context) => CartPage(),
      // },
    );
  }
}
