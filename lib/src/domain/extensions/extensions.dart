import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  Future push(Widget route) => Navigator.of(this).push(
        CupertinoPageRoute(
          builder: (context) => route,
        ),
      );
  Future pushModal(Widget route) => Navigator.of(this).push(
        CupertinoPageRoute(
          builder: (context) => route,
          fullscreenDialog: true,
        ),
      );

  void pop() => Navigator.of(this).pop();

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
}
