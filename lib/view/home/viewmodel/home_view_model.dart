import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/core/constants/navigation/navigation_constants.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
  }

}
