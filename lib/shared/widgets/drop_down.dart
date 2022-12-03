import 'package:tawzeef/shared/consts/exports.dart';

typedef RetreiveTitle<T> = String Function(T json);

// ignore: must_be_immutable
class MDropDown<T> extends StatelessWidget {
  final List<T> options;
  final T? setInitial;
  final String? hint;
  double? height;
  final bool check;
  final ValueChanged<T> onChanged;
  final bool isCenter;
  final bool removeBorder;
  final RetreiveTitle<T> itemTitle;
  final bool isExpanded;
  final Color? iconColor;
  final Color? textColor;
  final double textSize;
  final Color? dropdownColor;
  MDropDown({
    Key? key,
    required this.onChanged,
    required this.itemTitle,
    this.height,
    this.options = const [],
    this.removeBorder = false,
    this.hint = "",
    this.isCenter = false,
    this.setInitial,
    this.check = false,
    this.isExpanded = true,
    this.iconColor,
    this.textColor,
    this.textSize = 20,
    this.dropdownColor,
  }) : super(key: key);

  late AutoDisposeChangeNotifierProvider<DropDownController>
      dropdownController =
      AutoDisposeChangeNotifierProvider<DropDownController>(
    (ref) => DropDownController<T>(
      setInitial,
      options,
    ),
  );

  late DropDownController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      controller = ref.watch(dropdownController);
      return DropdownButton<T>(
        dropdownColor: dropdownColor,
        elevation: 2,
        underline: removeBorder
            ? const SizedBox()
            : Container(
                height: 0.5,
                color: coolors.primaryColor,
              ),
        isExpanded: isExpanded,
        icon: MSvg(
          name: svgs.dropdown,
          color: iconColor ?? const Color(0xff629677),
        ).mPadding(
          start: spaces.space12,
          end: removeBorder ? 0 : spaces.space12,
          bottom: removeBorder ? spaces.space5 : spaces.space21,
        ),
        hint: MText(
          text: hint,
          fontColor: textColor ?? coolors.primaryColor,
          fontSize: textSize,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
        ).mPadding(bottom: removeBorder ? 0 : spaces.space21),
        value: controller.type,
        onChanged: (value) {
          controller.changeValue(value);
          onChanged(value as T);
        },
        items: options.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: MText(
              fontColor: textColor ?? coolors.primaryColor,
              fontSize: textSize,
              text: itemTitle(item),
            ),
          );
        }).toList(),
      );
    });
  }
}

class DropDownController<T> extends ChangeNotifier {
  DropDownController(T? setInitial, List<T> options) {
    if (T is! String) {
      for (var element in options) {
        if (setInitial == element) {
          type = element;
        }
      }
    } else if (T is String) {
      type = setInitial;
    }
  }

  T? type;

  bool valid(check) {
    if (check && (type != null)) {
      return false;
    } else {
      return true;
    }
  }

  void changeValue(value) {
    type = value;
    notifyListeners();
  }
}
