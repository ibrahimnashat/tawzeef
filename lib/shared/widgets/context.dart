import 'package:flutter/material.dart';
import 'package:tawzeef/languages/localizations.dart';

extension OnContext on BuildContext {
  double get mWidth {
    return MediaQuery.of(this).size.width;
  }

  double get mHeight {
    return MediaQuery.of(this).size.height;
  }

  dynamic push(Widget widget) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  AppLocalizations? get localization => AppLocalizations.of(this);

  dynamic pushReplacement(Widget widget) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  dynamic pushAndRemoveUntil(Widget widget) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => widget),
      (_) => false,
    );
  }

  dynamic pushNamed(String screenName) {
    return Navigator.pushNamed(
      this,
      screenName,
    );
  }

  dynamic pop({dynamic data}) {
    return Navigator.pop(
      this,
      data,
    );
  }

  Future<bool> get maybePop async {
    return await Navigator.maybePop(this);
  }

  bool get canPop {
    return Navigator.canPop(this);
  }

  Orientation get mOrientation {
    return MediaQuery.of(this).orientation;
  }

  double get w => mWidth;
  double get h => mHeight;
  double get textMaxWidth => 450;
}
