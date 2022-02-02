import 'package:flutter/material.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/view/search/viewmodel/search_view_Model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SearchViewModel viewModel) => Scaffold(
        body: Column(
          children: [
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
