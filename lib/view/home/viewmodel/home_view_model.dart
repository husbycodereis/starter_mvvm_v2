import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
import 'package:movies_catalog/view/home/service/IHomeService.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late IHomeService homeService;
  late BuildContext buildContext;
  
  @override
  void setContext(BuildContext context) => buildContext = context;
  @override
  void init() {
  }
}
