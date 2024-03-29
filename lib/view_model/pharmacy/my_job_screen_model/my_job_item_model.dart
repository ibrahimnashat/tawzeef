import 'package:tawzeef/shared/consts/exports.dart';

class MyJobItemModel extends ChangeNotifier {
  CustomPopupMenuController popupMenuController = CustomPopupMenuController();

  void close() {
    popupMenuController.hideMenu();
  }

  @override
  void dispose() {
    popupMenuController.dispose();
    super.dispose();
  }
}
