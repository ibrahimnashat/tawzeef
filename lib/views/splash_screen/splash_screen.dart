import 'package:tawzeef/controller/consts/exports.dart';

class SplashScreen extends ConsumerWidget {
  SplashScreen({Key? key}) : super(key: key);

  final AutoDisposeProvider<SplashScreenModel> splashController =
      AutoDisposeProvider((create) => SplashScreenModel());

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(splashController).disposeScreen(context);
    return Scaffold(
      backgroundColor: coolors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            PositionedDirectional(
              top: -200,
              start: -200,
              child: MSvg(
                name: svgs.doubleCircle,
                width: 500,
                height: 500,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: DelayedDisplay(
                slidingBeginOffset:
                    Offset.fromDirection(Alignment.bottomCenter.y),
                delay: const Duration(milliseconds: 400),
                child: MSvg(
                  name: svgs.logo,
                  width: context.w,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
