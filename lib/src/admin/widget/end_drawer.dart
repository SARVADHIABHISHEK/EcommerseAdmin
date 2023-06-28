
import 'package:ecommerse_admin/src/admin/widget/svg_icon.dart';
import 'package:ecommerse_admin/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

import '../constant/allconst.dart';
import '../utils/hive/hive_keys.dart';
import '../utils/hive/hive_utils.dart';

class SettingDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SettingDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<SettingDrawer> createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.settings,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.scaffoldKey.currentState!.closeEndDrawer();
                  },
                  child: const SvgIcon(icon: IconlyBroken.closeSquare),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              Strings.chooseLayouts,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                FxBox.h8,
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    Images.light,
                    fit: BoxFit.cover,
                  ),
                ),
                FxBox.h8,
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    Images.dark,
                    fit: BoxFit.cover,
                  ),
                ),
                FxBox.h8,
                Row(
                  children: [
                    BlocBuilder<ThemeModeBloc, ThemeModeState>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                          value: HiveUtils.isContainKey(HiveKeys.themeMode)
                              ? HiveUtils.get(HiveKeys.themeMode)
                              : false,
                          onChanged: (value) {
                            HiveUtils.set(HiveKeys.themeMode, value);
                            themeModeBloc
                                .add(ThemeModeEvent.changeTheme(value));
                          },
                        );
                      },
                    ),
                    const Text(
                      Strings.darkMode,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                FxBox.h8,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
