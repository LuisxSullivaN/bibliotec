
import 'package:bibliotec/core/data/api/base_api.dart';
import 'package:bibliotec/core/models/subject.dart';
import 'package:bibliotec/core/service_locator.dart';
import 'package:bibliotec/core/services/navigation_service.dart';
import 'package:bibliotec/routes.dart' as routes;
import 'package:bibliotec/ui/base/base_model.dart';

class HomeModel extends BaseModel {
  final BaseApi _api = locator<BaseApi>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Subject> subjects = [];

  void fetchSubjects() async {
    setBusy(true);
    subjects = await _api.getAllSubjects();
    setBusy(false);
  }

  void navigateToBooks(Subject subject) {
    _navigationService.navigateTo(routes.books, arguments: subject);
  }
}
