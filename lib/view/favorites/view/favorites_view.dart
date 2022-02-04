import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
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
                body: model.loading ? const BasicLoadingWidget() : buildBody(model, context),
              );
            }));
  }

  Widget buildBody(FavoritesViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: viewModel.favoriteMovies.isEmpty
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
                    itemCount: viewModel.favoriteMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildDismissibleListItem(index, viewModel, context);
                    },
                  ),
                ),
              ],
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
        child: buildDismissibleListItemBody(viewModel, index, context),
      ),
    );
  }

  Row buildDismissibleListItemBody(FavoritesViewModel viewModel, int index, BuildContext context) {
    return Row(
      children: [
        Image.network(
          viewModel.favoriteMovies[index].fullImageUrl,
          width: 50,
          height: 100,
        ),
        context.sizedBoxMediumHorizontal,
        Expanded(child: Text(viewModel.favoriteMovies[index].title ?? 'No Title Found')),
      ],
    );
  }
}
