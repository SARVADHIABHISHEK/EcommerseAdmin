import 'package:auto_route/auto_route.dart';
import 'package:ecommerse_admin/src/admin/constant/allconst.dart';
import 'package:ecommerse_admin/src/admin/utils/hive/hive_utils.dart';
import 'package:ecommerse_admin/src/admin/utils/localizaion/multi_language.dart';
import 'package:ecommerse_admin/src/provider/fontBloc/font_bloc.dart';
import 'package:ecommerse_admin/src/provider/localization/localization_bloc.dart';
import 'package:ecommerse_admin/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:ecommerse_admin/src/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await HiveUtils.init();
    themeModeBloc.add(const ThemeModeEvent.changeTheme(null));
    localizationBloc.add(const LocalizationEvent.changeLanguage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => themeModeBloc),
        BlocProvider(create: (context) => localizationBloc),
        BlocProvider(
          create: (context) => FontBloc(),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            success: () {
              return BlocBuilder<ThemeModeBloc, ThemeModeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    success: (themeMode) {
                      return MaterialApp.router(
                        locale: languageModel.locale,
                        supportedLocales: languageModel.supportedLocales,
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          MultiLanguage.delegate,
                        ],
                        routerDelegate: AutoRouterDelegate(_appRouter),
                        routeInformationParser: _appRouter.defaultRouteParser(),
                        debugShowCheckedModeBanner: false,
                        theme: ThemeClass.themeData(
                          themeMode,
                          context,
                        ),
                        scrollBehavior: const MaterialScrollBehavior().copyWith(
                          dragDevices: {
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch,
                            PointerDeviceKind.stylus,
                            PointerDeviceKind.trackpad,
                            PointerDeviceKind.unknown
                          },
                        ),
                        title: 'Ecommerse Admin',
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
