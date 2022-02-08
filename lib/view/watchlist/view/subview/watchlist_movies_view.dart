import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/appbar/custom_appbar.dart';
import 'package:movies_catalog/core/components/widgets/cards/movie_list_card.dart';
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
        onModelReady: (model) async {
          model.setContext(context);
        },
        onPageBuilder: (WatchListViewModel model) => Scaffold(
              appBar: buildAppBar(context),
              body: Observer(
                builder: (_) {
                  return model.loading ? const BasicLoadingWidget() : buildBody(model, context);
                },
              ),
            ));
  }

  AppBar buildAppBar(BuildContext context) {
    return CustomAppBar(context: context, text: watchlist.name ?? '');
  }

  Widget buildBody(WatchListViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: watchlist.movies!.isEmpty
          ? Center(
              child: Text(
              'Add Movies to the List',
              style: context.textTheme.bodyText1,
            ))
          : ListView.separated(
              shrinkWrap: true,
              reverse: true,
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
    );
  }

  Widget buildDismissibleListItem(int index, WatchListViewModel viewModel, BuildContext context) {
    return DismissibleDeleteWidget(
      keyString: index.toString(),
      onDismissed: (direction) {
        viewModel.deleteMovieFromWatchlist(watchlist, watchlist.movies![index]);
      },
      child: GestureDetector(
        onTap: () {
          viewModel.navigateToDetails(watchlist.movies![index]);
        },
        child: MovieListCard(movie: watchlist.movies![index]),
      ),
    );
  }
}
