import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:tawzeef/controller/consts/exports.dart';

class MSvg extends StatelessWidget {
  final String? name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  const MSvg({
    Key? key,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "icons/svg/$name.svg",
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}

class MAssetImage extends StatelessWidget {
  final String? name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MAssetImage({
    Key? key,
    this.borderRadius = 0,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        "icons/png/$name.png",
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MFileImage extends StatelessWidget {
  final String file;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MFileImage({
    Key? key,
    this.borderRadius = 0,
    required this.file,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.file(
        File(file),
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MNetworkImage({
    Key? key,
    this.borderRadius = 0,
    this.url = "",
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: Alignment.center,
          errorWidget: (errorWidget, error, child) {
            return MAssetImage(
              name: pngs.empty,
              width: width,
              height: height,
              fit: fit,
              color: color,
              borderRadius: borderRadius,
            );
          },
          placeholder: (context, provider) => SizedBox(
            width: 22.0,
            height: 22.0,
            child: Center(
              child: SpinKitPouringHourGlass(
                color: coolors.white,
                duration: const Duration(milliseconds: 1200),
              ),
            ),
          ),
        ),
      );
    } else {
      return MAssetImage(
        name: pngs.empty,
        width: width,
        height: height,
        fit: fit,
        color: color,
        borderRadius: borderRadius,
      );
    }
  }
}
