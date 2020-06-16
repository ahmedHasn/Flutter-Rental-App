import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/services/ui/select_index.dart';
import 'package:app_navigation/ui/viewmodels/home_viewmodels.dart';
import 'package:app_navigation/ui/widgets/home.dart';
import 'package:app_navigation/ui/widgets/more.dart';
import 'package:app_navigation/ui/widgets/save.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {

  final List<Widget> _children = [
    HomeWidget(),
    SaveWidget(),
    MoreWidget()
  ];

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<HomeViewModel>.reactive(

        builder: (context, model, child ) => Scaffold(
          body: _children[model.selectIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.selectIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('Search')),
              BottomNavigationBarItem(icon: model.selectIndex == 1 ? Icon(Icons.favorite) : Icon(Icons.favorite_border) ,title: Text('Save Home')),
              BottomNavigationBarItem(icon: Icon(Icons.more_horiz),title: Text('More'))
            ],
            onTap: model.updateSelector,
          ),
        ),
        viewModelBuilder: () => HomeViewModel()
    );
  }
}
