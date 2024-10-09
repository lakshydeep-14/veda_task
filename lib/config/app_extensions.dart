import 'dart:io';
import 'package:veda_task/config/app_extensions.dart';
export './constants/constants.dart';
export 'app_config.dart';
export 'colors/app_colors.dart';
export 'images/app_images.dart';
export 'routes/go_router.dart';
export './routes/route_model.dart';
export './routes/routes.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'themes/app_font_size.dart';
export 'themes/app_theme/app_theme.dart';
export 'themes/text_theme/app_text_theme.dart';
export '../widgets/wid_extension.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:go_router/go_router.dart';
export 'package:flutter_svg/svg.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  IconThemeData get iconThem => theme.iconTheme;
  TextTheme get text => theme.textTheme;
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get devicePaddingTop =>
      Platform.isAndroid ? MediaQuery.of(this).padding.top : 35;
  double get devicePaddingBottom => MediaQuery.of(this).padding.bottom;
  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;

  statusBarColorWhite({bool isWhite = false}) {
    if (!isWhite) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ));
    }
  }

  hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusScope.of(this).unfocus();
  }
}
