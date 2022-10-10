import 'package:tawzeef/controller/consts/exports.dart';

UrlModel urlModel = UrlModel._private();

class UrlModel extends ChangeNotifier {
  Future<void> openUrl({
    String? url = '',
    required BuildContext context,
  }) async {
    final uri = Uri.parse(url ?? '');
    if (await canLaunchUrl(uri) ||
        (url?.contains('.pdf') ?? false) ||
        (url?.contains('.doc') ?? false)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Toast.showOnError(context, context.localization?.linkCannotOpen);
    }
  }

  UrlModel._private();
}
