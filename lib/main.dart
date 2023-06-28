
import 'package:ecommerse_admin/myApp.dart';
import 'package:ecommerse_admin/src/admin/utils/localizaion/multi_language.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (TargetPlatform.windows == defaultTargetPlatform ||
      TargetPlatform.macOS == defaultTargetPlatform ||
      TargetPlatform.linux == defaultTargetPlatform) {
    setWindowTitle('AdminKit');
    setWindowMinSize(const Size(480, 360));
    setWindowMaxSize(Size.infinite);
  }
  setPathUrlStrategy();
  await languageModel.load();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(bloc);
    print(event);
    // TODO: implement onEvent
  }
}
