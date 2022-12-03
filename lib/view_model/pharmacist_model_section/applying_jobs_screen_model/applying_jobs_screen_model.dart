import 'package:tawzeef/shared/consts/exports.dart';

class ApplyingScreenModel extends ChangeNotifier {
  late bool isLoading;
  final List<JobModel> applyingJobs = [];
  final applyingJobsServices = GetApplyingJobsServices();

  ApplyingScreenModel(BuildContext context) {
    getApplyingJobs(context);
  }

  Future<void> getApplyingJobs(
    BuildContext context,
  ) async {
    isLoading = true;
    await applyingJobsServices.getApplyingJobs(
      apiToken: localSavingData.logUser.apiToken,
      context: context,
      onSeccuss: (res, message) {
        isLoading = false;
        Toast.showOnSuccessfully(context, message);
        applyingJobs.addAll(res.job!);
        notifyListeners();
      },
      onError: (status, message) {
        isLoading = false;
        Toast.showOnError(context, message);
        notifyListeners();
      },
    );
  }
}
