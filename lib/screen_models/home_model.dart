import 'package:bibliotec/locator.dart';
import 'package:bibliotec/models/api_definition.dart';
import 'package:bibliotec/models/subject.dart';
import 'package:bibliotec/screen_models/base_model.dart';

class HomeModel extends BaseModel {
  ApiDefinition _api = kLocator<ApiDefinition>();

  List<Subject> subjects;

  Future fetchSubjects() async {
    setStatus(ViewStatus.Busy);
    subjects = await _api.getSubjects();
    setStatus(ViewStatus.Idle);
  }
}
