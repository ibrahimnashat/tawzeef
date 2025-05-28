import '../consts/exports.dart';

class MResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const MResponsiveWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(start: 481, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1000, name: DESKTOP),
        Breakpoint(start: 1001, end: 1200, name: '4K'),
      ],
      child: child,
    );
  }

  static Widget wrapper({
    required Widget child,
    required BuildContext context,
  }) {
    return MaxWidthBox(
      maxWidth: 1200,
      backgroundColor: const Color(0xFFF5F5F5),
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(
          context,
          conditionalValues: [
            const Condition.equals(name: MOBILE, value: 480),
            const Condition.between(start: 800, end: 1000, value: 800),
            const Condition.between(start: 1001, end: 1200, value: 1001),
          ],
        ).value,
        child: BouncingScrollWrapper.builder(
          context,
          child,
          dragWithMouse: true,
        ),
      ),
    );
  }
}
