import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class SelectIndexService with ReactiveServiceMixin{

  RxValue<int> _current = RxValue<int>(initial: 0);

  SelectIndexService(){
    listenToReactiveValues([_current]);
  }

  int get current => _current.value;

  void onTapped(int val){
    _current.value = val;
  }

}