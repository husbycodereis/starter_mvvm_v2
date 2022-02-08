import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/appbar/custom_appbar.dart';
import 'package:movies_catalog/core/components/widgets/cards/movie_list_card.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
import 'package:movies_catalog/core/components/widgets/divider/custom_divider.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
        viewModel: serviceLocator<FavoritesViewModel>(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (FavoritesViewModel model) => Observer(builder: (_) {
              return Scaffold(
                appBar: CustomAppBar(text: 'Favorites', context: context),
                body: model.loading ? const BasicLoadingWidget() : buildBody(model, context),
              );
            }));
  }

  Widget buildBody(FavoritesViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: viewModel.favoriteMovies.isEmpty
          ? const Center(child: Text('There are no favorite movies'))
          : ListView.separated(
              shrinkWrap: true,
              reverse: true,
              separatorBuilder: (context, index) {
                return const CustomDivider();
              },
              itemCount: viewModel.favoriteMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return buildDismissibleListItem(index, viewModel, context);
              },
            ),
    );
  }

  Widget buildDismissibleListItem(int index, FavoritesViewModel viewModel, BuildContext context) {
    return DismissibleDeleteWidget(
      keyString: index.toString(),
      onDismissed: (direction) {
        viewModel.deleteFavorite(viewModel.favoriteMovies[index]);
      },
      child: GestureDetector(
        onTap: () {
          viewModel.navigateToDetails(viewModel.favoriteMovies[index]);
        },
        child: Padding(
          padding: context.paddingLowVertical,
          child: MovieListCard(movie: viewModel.favoriteMovies[index]),
        ),
      ),
    );
  }
}
