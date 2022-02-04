import 'package:flutter/material.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/bottom_sheet/modal_bottom_sheet_container.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

class WatchListModalBottomSheet extends StatelessWidget {
  final MovieResultModel movie;

  const WatchListModalBottomSheet({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WatchListViewModel>(
      viewModel: serviceLocator<WatchListViewModel>(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (WatchListViewModel model) => ModalBottomSheetContainer(
          height: context.dynamicHeight(0.55),
          child: model.watchlistList.isEmpty
              ? const Center(child: Text('Create a Watchlist'))
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                  itemCount: model.watchlistList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        model.addMovieToWatchList(movie, model.watchlistList[index].name!, context);
                      },
                      child: Padding(
                        padding: context.paddingNormalVertical,
                        child: Text(model.watchlistList[index].name!),
                      ),
                    );
                  })),
    );
  }
}
