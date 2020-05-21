import 'package:flutter/material.dart';

enum ViewStatus {
  Idle, Busy
}
class BaseModel extends ChangeNotifier {
  ViewStatus _status = ViewStatus.Idle;

  ViewStatus get status => _status;

  void setStatus(ViewStatus status) {
    _status = status;
    notifyListeners();
  }
}
