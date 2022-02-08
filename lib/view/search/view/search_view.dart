import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/divider/custom_divider.dart';
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
        onPageBuilder: (SearchViewModel viewModel) => Observer(builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  automaticallyImplyLeading: false,
                  //  title: Text('Search', style: context.textTheme.headline3),
                ),
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
          SearchFieldWidget(
            controller: viewModel.searchController,
            hintText: 'Search',
            onPressedCancel: () => viewModel.dispose(),
            isAbleToCancel: viewModel.searchQuery.isNotEmpty,
          ),
          context.sizedBoxLowVertical,
          if (viewModel.searchResultList.isEmpty) buildEmptyListView(context) else buildListView(viewModel),
        ],
      ),
    );
  }

  Expanded buildListView(SearchViewModel viewModel) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const CustomDivider();
        },
        itemCount: viewModel.searchResultList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => viewModel.navigateToDetails(viewModel.searchResultList[index]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                viewModel.searchResultList[index].title ?? 'No Title Found',
                style: context.textTheme.bodyText1!.copyWith(fontSize: 14.sp),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildEmptyListView(BuildContext context) => Padding(
      padding: context.paddingHighVertical, child: Text('Search for movies', style: context.textTheme.bodyText1));
}

