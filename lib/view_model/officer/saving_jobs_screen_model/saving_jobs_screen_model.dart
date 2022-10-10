import 'package:tawzeef/controller/consts/exports.dart';
import 'package:tawzeef/models/objects/job_model.dart';
import 'package:tawzeef/services/officer_services/get_saving_jobs_services.dart';
import 'package:tawzeef/services/officer_services/save_job_services.dart';

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
      apiToken: localSavingData.logUser.apiToken,
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
      apiToken: localSavingData.logUser.apiToken,
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