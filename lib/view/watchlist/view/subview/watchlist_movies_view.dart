import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/watchlist/model/watchlist_model.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

class WatchListMoviesView extends StatelessWidget {
  final WatchListModel watchlist;

  const WatchListMoviesView({Key? key, required this.watchlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WatchListViewModel>(
        viewModel: serviceLocator<WatchListViewModel>(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, WatchListViewModel model) => Observer(builder: (_) {
              return Scaffold(
                appBar: AppBar(),
                body: model.loading ? const BasicLoadingWidget() : buildBody(model, context),
              );
            }));
  }

  Widget buildBody(WatchListViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: watchlist.movies!.isEmpty
          ? const Center(child: Text('There are no favorite movies'))
          : Column(
              children: [
                context.sizedBoxHighVertical,
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 2,
                      );
                    },
                    itemCount: watchlist.movies!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildDismissibleListItem(index, viewModel, context);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildDismissibleListItem(int index, WatchListViewModel viewModel, BuildContext context) {
    return DismissibleDeleteWidget(
      keyString: index.toString(),
      onDismissed: (direction) {
        //  viewModel.deleteFavorite(viewModel.favoriteMovies[index]);
      },
      child: GestureDetector(
        onTap: () {
          //  viewModel.navigateToDetails(viewModel.favoriteMovies[index]);
        },
        child: buildDismissibleListItemBody(viewModel, index, context),
      ),
    );
  }

  Row buildDismissibleListItemBody(WatchListViewModel viewModel, int index, BuildContext context) {
    return Row(
      children: [
        Image.network(
          watchlist.movies![index].fullImageUrl,
          width: 50,
          height: 100,
        ),
        context.sizedBoxMediumHorizontal,
        Expanded(child: Text(watchlist.movies![index].title ?? 'No Title Found')),
      ],
    );
  }
}
