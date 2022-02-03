import 'package:flutter/material.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

class WatchListView extends StatelessWidget{
 const WatchListView({Key? key}) : super(key: key);
 
 @override
 Widget build(BuildContext context) {
  return BaseView<WatchListViewModel>(
   viewModel: WatchListViewModel(),
   onModelReady: (model) {
    model.setContext(context);
    model.init();
   },
   onPageBuilder: (BuildContext context,WatchListViewModel model) => Scaffold(),
  );
 }
}