import 'package:tawzeef/shared/consts/exports.dart';

class MyJobScreenModel extends ChangeNotifier {
  List<JobModel> jobs = [];
  final getJobsServices = GetMyJobsServices();
  bool isLoading = true;
  MyJobScreenModel(BuildContext context) {
    getJobs(context);
  }

  Future<void> getJobs(BuildContext context) async {
    await getJobsServices.getMyJobs(
      apiToken: localSavingData.logUser.apiToken ?? '',
      onSeccuss: (res, message) {
        isLoading = false;
        jobs.addAll(res.job!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
