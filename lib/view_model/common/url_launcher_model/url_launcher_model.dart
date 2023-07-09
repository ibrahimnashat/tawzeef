import 'package:tawzeef/shared/consts/exports.dart';

UrlLauncherModel urlLauncher = UrlLauncherModel._private();

class UrlLauncherModel extends ChangeNotifier {
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

  UrlLauncherModel._private();
}
