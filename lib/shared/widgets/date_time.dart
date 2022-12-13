import 'package:intl/intl.dart';

extension OnDateTime on DateTime {
  String get timeOnly => DateFormat('hh:mm a', 'en').format(this);
  String get dateOnly => DateFormat('yyyy-MM-dd', 'en').format(this);
  String get timeAndDate => DateFormat('yyyy-MM-dd hh:mm a', 'en').format(this);
  String get monthAndDay => DateFormat('dd MMM', 'en').format(this);
  String get yearMonthDay => DateFormat('dd MMM yyyy', 'en').format(this);
}
