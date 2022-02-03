import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
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
        onPageBuilder: (BuildContext context, FavoritesViewModel model) => Observer(builder: (_) {
              return Scaffold(
                body: model.loading ? buildLoading() : buildBody(model, context),
              );
            }));
  }

  Center buildLoading() => const Center(child: CircularProgressIndicator());

  Widget buildBody(FavoritesViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: Column(
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
                return GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image.network(
                        viewModel.favoriteMovies[index].fullImageUrl,
                        width: 50,
                        height: 100,
                      ),
                      context.sizedBoxMediumHorizontal,
                      Expanded(child: Text(viewModel.favoriteMovies[index].title ?? 'No Title Found')),
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
