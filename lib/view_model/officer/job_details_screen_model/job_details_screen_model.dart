import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/services/officer_services/apply_job_services.dart';
import 'package:tawzeef/services/officer_services/get_job_services.dart';
import 'package:tawzeef/services/officer_services/save_job_services.dart';
import 'package:tawzeef/services/officer_services/view_job_services.dart';

class JobDetailsScreenModel extends ChangeNotifier {
  bool isSaved = false;
  bool isApply = false;
  int applyingCount = 0;
  final applyJobServices = ApplyJobServices();
  final saveJobServices = SaveJobServices();
  final viewJobServices = ViewJobServices();
  final jobSerives = GetJobServices();

  JobDetailsScreenModel(jobId) {
    _viewJob(jobId);
    _getJob(jobId);
  }

  Future<void> _viewJob(int jobId) async {
    await viewJobServices.viewJob(
      jobId: jobId,
      onSeccuss: (res, message) {
        localSavingData.debuggerPrint('$message viewed');
      },
      onError: (status, message) {},
    );
  }

  Future<void> _getJob(int jobId) async {
    await jobSerives.getJob(
      apiToken: localSavingData.logUser.apiToken ?? '',
      jobId: jobId,
      onSeccuss: (res, message) {
        applyingCount = res.applyingCount ?? 0;
        isSaved = res.isSaved == 1 ? true : false;
        isApply = res.isApply == 1 ? true : false;
        notifyListeners();
      },
      onError: (status, message) {},
    );
  }

  Future<void> saveJob(
    BuildContext context,
    int jobId,
  ) async {
    Loader.show(context: context);
    await saveJobServices.saveJob(
      apiToken: localSavingData.logUser.apiToken,
      jobId: jobId,
      context: context,
      onSeccuss: (res, message) {
        isSaved = !isSaved;
        notifyListeners();
        Loader.dismiss(context);
        Toast.showOnSuccessfully(context, message);
      },
      onError: (status, message) {
        Loader.dismiss(context);
        Toast.showOnError(context, message);
      },
    );
  }

  Future<void> applyJob(
    BuildContext context,
    int jobId,
  ) async {
    Loader.show(context: context);
    await applyJobServices.applyJob(
      apiToken: localSavingData.logUser.apiToken,
      jobId: jobId,
      context: context,
      onSeccuss: (res, message) {
        Loader.dismiss(context);
        isApply = !isApply;
        showDialog(
          barrierDismissible: false,
          useSafeArea: true,
          context: context,
          builder: (context) => AlertSuccesfullyItem(isApply: isApply),
        );
        notifyListeners();
      },
      onError: (status, message) {
        Loader.dismiss(context);
        Toast.showOnError(context, message);
      },
    );
  }
}
