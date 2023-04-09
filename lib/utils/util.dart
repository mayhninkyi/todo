
import 'package:flutter/material.dart';
import 'package:todo/utils/constant.dart';

Widget kVerticalSpace(double height) => SizedBox(
      height: height,
    );

Widget kHorizontalSpace(double width) => SizedBox(
      width: width,
    );


extension NavigatorExtension<T> on BuildContext {
  Future<T?> next<T>(Widget w, {Function? result}) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => w));
  }

  void back([T? result]) {
    return Navigator.pop(this, result);
  }
}


TextStyle kTextStyle(double size) {
  return TextStyle(fontSize: size, color: secondaryColor);
}

TextStyle kTextStyleWhite(double size) {
  return TextStyle(fontSize: size, color: Colors.white);
}