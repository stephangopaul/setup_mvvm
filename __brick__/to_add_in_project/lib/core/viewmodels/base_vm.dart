import 'package:flutter/cupertino.dart';
import 'package:{{project_name}}/core/enums/view_state.dart';

class BaseVM extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  String? _errorMessage;

  ViewState get state => _state;
  String? get errorMEssage => _errorMessage;

  void applyState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setError(String error) {
    _errorMessage = error;
  }
}
