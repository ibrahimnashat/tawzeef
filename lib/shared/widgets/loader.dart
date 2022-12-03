import '../consts/exports.dart';

class Loader {
  static void show({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0.0,
            contentPadding: EdgeInsets.all(spaces.space35),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AwesomeLoader(
                  loaderType: AwesomeLoader.AwesomeLoader3,
                  color: coolors.primaryColor,
                ),
              ],
            ),
          );
        });
  }

  static Widget empty() {
    return SizedBox(
      height: 700,
      child: Center(
        child: MSvg(
          name: svgs.empty,
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  static Widget loading() {
    return Center(
      child: AwesomeLoader(
        loaderType: AwesomeLoader.AwesomeLoader3,
        color: coolors.primaryColor,
      ),
    );
  }

  static void dismiss(BuildContext context) => context.pop();
}
