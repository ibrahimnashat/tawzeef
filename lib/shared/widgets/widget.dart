import 'dart:math';

import '../consts/exports.dart';

extension WidgetController on Widget {
  Widget get mCircular {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: this,
    );
  }

  Widget mRadius(double radis) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radis),
      child: this,
    );
  }

  Widget mAddAction({required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: this,
    );
  }

  Widget get mNotStratch => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [this],
      );

  Widget get mStretch {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      child: this,
    );
  }

  Widget get mScrolling {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: this,
    );
  }

  Widget get mFlap {
    if (settings.locale.languageCode == 'ar') {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: this,
      );
    } else {
      return this;
    }
  }

  Widget get mFlapEn {
    if (settings.locale.languageCode == 'en') {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: this,
      );
    } else {
      return this;
    }
  }
}
