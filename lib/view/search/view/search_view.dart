import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/view/search/viewmodel/search_view_Model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
        viewModel: SearchViewModel(),
        onModelReady: (model) {
          print('hello buradayim');
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SearchViewModel viewModel) => Observer(builder: (_) {
              return Scaffold(
                body: viewModel.loading ? const Center(child: CircularProgressIndicator()) : buildBody(viewModel),
              );
            }));
  }

  ListView buildBody(SearchViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.searchResultList!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: context.paddingLowHorizontal,
          child: GestureDetector(
            onTap: () => viewModel.navigateToDetails(viewModel.searchResultList![index]),
            child: Row(
              children: [
                Image.network(
                  viewModel.searchResultList![index].fullImageUrl,
                  width: 50,
                  height: 100,
                ),
                context.sizedBoxMediumHorizontal,
                Expanded(child: Text(viewModel.searchResultList![index].title ?? 'No Title Found')),
              ],
            ),
          ),
        );
      },
    );
  }
}
