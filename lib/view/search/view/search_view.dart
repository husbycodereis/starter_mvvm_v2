import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/searchbar/search_field_widget.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
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
        onDispose: (model) {
          model.dispose();
        },
        onPageBuilder: (BuildContext context, SearchViewModel viewModel) => Observer(builder: (_) {
              return Scaffold(
                body: viewModel.loading ? buildLoading() : buildBody(viewModel, context),
              );
            }));
  }

  Center buildLoading() => const Center(child: CircularProgressIndicator());

  Widget buildBody(SearchViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: Column(
        children: [
          context.sizedBoxHighVertical,
          SearchFieldWidget(
            controller: viewModel.searchController,
            onPressedCancel: () => viewModel.dispose(),
            isAbleToCancel: viewModel.searchQuery.isNotEmpty,
          ),
          if (viewModel.searchResultList.isEmpty)
            Padding(padding: context.paddingHighVertical, child: const Text('Search for movies'))
          else
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
                itemCount: viewModel.searchResultList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => viewModel.navigateToDetails(viewModel.searchResultList[index]),
                    child: Row(
                      children: [
                        Image.network(
                          viewModel.searchResultList[index].fullImageUrl,
                          width: 50,
                          height: 100,
                        ),
                        context.sizedBoxMediumHorizontal,
                        Expanded(child: Text(viewModel.searchResultList[index].title ?? 'No Title Found')),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
