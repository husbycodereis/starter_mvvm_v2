import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
part 'search_view_Model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store, BaseViewModel {
  

   @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
  }
}