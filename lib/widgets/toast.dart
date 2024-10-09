// ignore_for_file: constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:veda_task/config/app_extensions.dart';

class NewToastUtils {
  static showSuccessToast(
    String msg,
  ) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade900,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showErrorToast(String msg, {bool isSuccess = true}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade900,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
