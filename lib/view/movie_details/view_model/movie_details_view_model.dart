import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_catalog/core/base/model/base_view_model.dart';
part 'movie_details_view_model.g.dart';

class MovieDetailsViewModel = _MovieDetailsViewModelBase with _$MovieDetailsViewModel;

abstract class _MovieDetailsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}