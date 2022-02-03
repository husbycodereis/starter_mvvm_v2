import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/button/normal_button.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
import 'package:movies_catalog/view/favorites/viewmodel/favorites_view_model.dart';

import 'package:movies_catalog/view/search/model/movie_result.dart';
import 'package:movies_catalog/view/search/viewmodel/search_view_Model.dart';

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
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        widget.movie.isFavorite ??= false;
      },
      onPageBuilder: (BuildContext context, SearchViewModel model) => Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(widget.movie.title ?? 'No Title Found')),
              NormalButton(
                  child: Text('Save to Favorites'),
                  onPressed: () {
                    setState(() {
                      serviceLocator<FavoritesViewModel>().setFavorite(widget.movie);
                    });
                  }),
              Text(widget.movie.isFavorite.toString())
            ],
          )),
    );
  }
}
