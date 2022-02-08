import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/button/movie_details_button.dart';
import 'package:movies_catalog/core/components/widgets/button/normal_button.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
import 'package:movies_catalog/core/components/widgets/text_form_field/custom_text_form_field.dart';
import 'package:movies_catalog/core/constants/image/image_path_svg.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/core/init/di/injection_container.dart';
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
        onPageBuilder: (WatchListViewModel model) => Observer(builder: (_) {
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
          context.sizedBoxLowVertical,
          SizedBox(
            width: 200.w,
            child: MovieDetailsButton(
                onPressed: () {
                  viewModel.createWatchList();
                },
                assetName: SVGImagePaths.instance!.plus,
                text: 'Create'),
          ),
          context.sizedBoxHighVertical,
          if (viewModel.watchlistList.isEmpty)
            Center(child: Text('Create a watchlist', style: context.textTheme.bodyText1))
          else
            buildWatchlistView(viewModel),
        ],
      ),
    );
  }

  Widget buildTextFormField(BuildContext context, WatchListViewModel viewModel) {
    return CustomTextFormField(
      controller: viewModel.watchlistController,
      labelText: 'Enter a Watchlist name',
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
              child: GestureDetector(
                onTap: () {
                  viewModel.navigateToMoviesView(viewModel.watchlistList[index]);
                },
                child: Padding(
                  padding: context.paddingNormalVertical,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SVGImagePaths.instance!.list,
                        width: 23.w,
                        color: context.customColors.azure,
                      ),
                      context.sizedBoxLowHorizontal,
                      Text(viewModel.watchlistList[index].name!, style: context.textTheme.bodyText1),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
