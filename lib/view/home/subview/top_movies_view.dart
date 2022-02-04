import 'package:flutter/material.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/view/home/viewmodel/home_view_model.dart';

class TopMoviesView extends StatelessWidget{
 const TopMoviesView({Key? key}) : super(key: key);
 
 @override
 Widget build(BuildContext context) {
  return BaseView<HomeViewModel>(
   viewModel: HomeViewModel(),
   onModelReady: (model) {
    model.setContext(context);
    model.init();
   },
   onPageBuilder: (BuildContext context,HomeViewModel model) => Scaffold(),
  );
 }
}