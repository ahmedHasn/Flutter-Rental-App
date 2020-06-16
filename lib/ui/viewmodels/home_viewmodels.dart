import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/services/ui/select_index.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel {

  final _selectService = locator<SelectIndexService>();
  int get selectIndex => _selectService.current;

  void updateSelector(int val){
    _selectService.onTapped(val);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_selectService];
}