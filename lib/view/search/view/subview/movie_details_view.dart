import 'package:flutter/material.dart';

import 'package:movies_catalog/view/search/model/movie_result.dart';

class MovieDetailsView extends StatelessWidget {
  MovieResultModel model;

  MovieDetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text(model.title ?? 'No Title Found'))],
      ),
    );
  }
}
