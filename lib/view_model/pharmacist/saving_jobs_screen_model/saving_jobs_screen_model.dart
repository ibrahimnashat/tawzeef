import 'package:tawzeef/shared/consts/exports.dart';

class SavingScreenModel extends ChangeNotifier {
  late bool isLoading;
  final List<JobModel> saveingJobs = [];
  final savingJobsServices = GetSavingJobsServices();
  final saveJobServices = SaveJobServices();

  SavingScreenModel(BuildContext context) {
    getSavingJobs(context);
  }

  Future<void> getSavingJobs(
    BuildContext context,
  ) async {
    isLoading = true;
    await savingJobsServices.getSaveingJobs(
      apiToken: localStorage.logUser.apiToken,
      context: context,
      onSeccuss: (res, message) {
        isLoading = false;
        Toast.showOnSuccessfully(context, message);
        saveingJobs.addAll(res.job!);
        notifyListeners();
      },
      onError: (status, message) {
        isLoading = false;
        Toast.showOnError(context, message);
        notifyListeners();
      },
    );
  }

  Future<void> saveJob(
    BuildContext context,
    int jobId,
  ) async {
    Loader.show(context: context);
    await saveJobServices.saveJob(
      apiToken: localStorage.logUser.apiToken,
      jobId: jobId,
      context: context,
      onSeccuss: (res, message) async {
        Loader.dismiss(context);
        saveingJobs.removeWhere((element) => element.id == jobId);
        notifyListeners();
        Toast.showOnSuccessfully(context, message);
      },
      onError: (status, message) {
        Loader.dismiss(context);
        Toast.showOnError(context, message);
      },
    );
  }
}
