import 'package:flutter/material.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/button/normal_button.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';
import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/search/viewmodel/search_view_Model.dart';
import 'package:movies_catalog/view/watchlist/viewmodel/watchlist_view_model.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieResultModel movie;

  const MovieDetailsView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        checkFavorite();
        
      },
      onPageBuilder: ( SearchViewModel model) => Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(widget.movie.title ?? 'No Title Found')),
              NormalButton(
                  child: const Text('Save to Favorites'),
                  onPressed: () {
                    setState(() {
                      serviceLocator<FavoritesViewModel>().setFavorite(widget.movie);
                    });
                  }),
              Text(widget.movie.isFavorite.toString()),
              NormalButton(
                  child: const Text('Add to a watchlist'),
                  onPressed: () {
                    setState(() {
                      serviceLocator<WatchListViewModel>().showWatchlistBottomSheet(widget.movie, context);
                    });
                  }),
            ],
          )),
    );
  }

  void checkFavorite() {
    widget.movie.isFavorite = serviceLocator<FavoritesViewModel>().checkFavorite(widget.movie);
  }
}
