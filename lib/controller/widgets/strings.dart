import 'package:tawzeef/controller/consts/exports.dart';

extension OnString on String {
  String get dateOnly => DateTime.tryParse(this)?.dateOnly ?? '';
  String get monthAndDay => DateTime.tryParse(this)?.monthAndDay ?? '';
  String get yearMonthDay => DateTime.tryParse(this)?.yearMonthDay ?? '';
}
