import 'package:tawzeef/shared/consts/exports.dart';

class JobApplicantsScreenModel extends ChangeNotifier {
  late int jobId;
  int index = 0;
  List<Map<String, dynamic>> options = [];
  bool isLoading = true;
  JobApplicantsScreenModel(BuildContext context, this.jobId) {
    _loadingHome(context);
  }
  List<UserModel> currentUsers = [];
  final jobApplicantsServices = GetUsersOfJobServices();
  final changeUserStatus = ChangeUserApplyingStatusServices();

  Future<void> _loadingHome(BuildContext context) async {
    options = [
      {'name': context.localization?.allRequests ?? '', 'value': null},
      {'name': context.localization?.apply ?? '', 'value': 'apply'},
      {'name': context.localization?.reject ?? '', 'value': 'reject'},
      {'name': context.localization?.inReview ?? '', 'value': 'inreview'},
    ];
    await getUsersOfJob(context);
  }

  void changeIndex(BuildContext context, value) {
    index = value;
    _changeStatus(context);
  }

  Future<void> _changeStatus(BuildContext context) async {
    await getUsersOfJob(context, status: options[index]['value']);
  }

  Future<void> getUsersOfJob(
    BuildContext context, {
    String? status,
  }) async {
    isLoading = true;
    notifyListeners();
    await jobApplicantsServices.getUsersOfJob(
      context: context,
      apiToken: localSavingData.logUser.apiToken ?? '',
      jobId: jobId,
      status: status,
      onSeccuss: (res, message) {
        isLoading = false;
        currentUsers.clear();
        currentUsers.addAll(res.users!);
        notifyListeners();
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
        isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> changeJobStatus(BuildContext context, status, int userId) async {
    Loader.show(context: context);
    await changeUserStatus.changeStatus(
      apiToken: localSavingData.logUser.apiToken ?? '',
      jobId: jobId,
      status: status,
      context: context,
      userId: userId,
      onSeccuss: (res, message) {
        Loader.dismiss(context);
      },
      onError: (status, error) {
        Toast.showOnError(context, error);
      },
    );
  }
}
