import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/button/normal_button.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WatchListViewModel>(
        viewModel: serviceLocator<WatchListViewModel>(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onDispose: (model) {
          model.dispose();
        },
        onPageBuilder: (BuildContext context, WatchListViewModel model) => Observer(builder: (_) {
              return Scaffold(
                body: model.loading ? const BasicLoadingWidget() : buildBody(model, context),
              );
            }));
  }

  Widget buildBody(WatchListViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: Column(
        children: [
          context.sizedBoxHighVertical,
          buildTextFormField(context, viewModel),
          NormalButton(
              child: const Text('create'),
              onPressed: () {
                viewModel.createWatchList();
              }),
          context.sizedBoxHighVertical,
          if (viewModel.watchlistList.isEmpty)
            const Center(child: Text('Create a watchlist'))
          else
            buildWatchlistView(viewModel),
        ],
      ),
    );
  }

  TextFormField buildTextFormField(BuildContext context, WatchListViewModel viewModel) {
    return TextFormField(
          style: context.textTheme.bodyText1,
          decoration: InputDecoration(
            hintStyle: context.textTheme.bodyText2,
            border: InputBorder.none,
            hintText: 'Enter a Watchlist name',
          ),
          controller: viewModel.watchlistController,
          focusNode: viewModel.watchlistFocus,
          onFieldSubmitted: (value) {
            viewModel.unfocusKeyboard();
          },
        );
  }

  Expanded buildWatchlistView(WatchListViewModel viewModel) {
    return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2,
                );
              },
              itemCount: viewModel.watchlistList.length,
              itemBuilder: (BuildContext context, int index) {
                return DismissibleDeleteWidget(
                    keyString: index.toString(),
                    onDismissed: (direction) {
                      viewModel.deleteWatchlist(viewModel.watchlistList[index]);
                    },
                    child: Padding(
                      padding: context.paddingNormalVertical,
                      child: Text(viewModel.watchlistList[index].name!),
                    ));
              },
            ),
          );
  }
}
