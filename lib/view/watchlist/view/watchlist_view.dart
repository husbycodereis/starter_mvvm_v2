import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/appbar/custom_appbar.dart';
import 'package:movies_catalog/core/components/widgets/button/movie_details_button.dart';
import 'package:movies_catalog/core/components/widgets/dismissible/dismissible_delete_widget.dart';
import 'package:movies_catalog/core/components/widgets/divider/custom_divider.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
import 'package:movies_catalog/core/components/widgets/text_form_field/custom_text_form_field.dart';
import 'package:movies_catalog/core/constants/app/text_constants.dart';
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
                appBar: CustomAppBar(
                  text: TextConstants.home_watchlist,
                  context: context,
                ),
                body: model.loading ? const BasicLoadingWidget() : buildBody(model, context),
              );
            }));
  }

  Widget buildBody(WatchListViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: Column(
        children: [
          context.sizedBoxNormalVertical,
          buildTextFormField(context, viewModel),
          context.sizedBoxLowVertical,
          buildCreateButton(viewModel),
          context.sizedBoxNormalVertical,
          if (viewModel.watchlistList.isEmpty)
            Center(child: Text(TextConstants.watchlist_create, style: context.textTheme.bodyText1))
          else
            buildWatchlistView(viewModel, context),
        ],
      ),
    );
  }

  Widget buildTextFormField(BuildContext context, WatchListViewModel viewModel) {
    return CustomTextFormField(
      controller: viewModel.watchlistController,
      labelText: TextConstants.watchlist_enter,
      focusNode: viewModel.watchlistFocus,
      onFieldSubmitted: (value) {
        viewModel.unfocusKeyboard();
      },
    );
  }

  SizedBox buildCreateButton(WatchListViewModel viewModel) {
    return SizedBox(
      width: 165.w,
      child: MovieDetailsButton(
          onPressed: () {
            viewModel.createWatchList();
          },
          assetName: SVGImagePaths.instance!.plus,
          text: TextConstants.watchlist_create_word),
    );
  }

  Widget buildWatchlistView(WatchListViewModel viewModel, BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.sizedBoxNormalVertical,
          CustomDivider(context: context),
          context.sizedBoxNormalVertical,
          Text(TextConstants.watchlist_lists,
              style: context.textTheme.headline4!.copyWith(color: context.customColors.azure)),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return CustomDivider(context: context);
              },
              itemCount: viewModel.watchlistReversed.length,
              itemBuilder: (BuildContext context, int index) {
                return DismissibleDeleteWidget(
                    keyString: index.toString(),
                    onDismissed: (direction) {
                      viewModel.deleteWatchlist(viewModel.watchlistReversed[index]);
                    },
                    child: GestureDetector(
                      onTap: () {
                        viewModel.navigateToMoviesView(viewModel.watchlistReversed[index]);
                      },
                      child: buildListItem(context, viewModel, index),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildListItem(BuildContext context, WatchListViewModel viewModel, int index) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: Row(
        children: [
          SvgPicture.asset(
            SVGImagePaths.instance!.list,
            width: 23.w,
            color: context.customColors.azure,
          ),
          context.sizedBoxLowHorizontal,
          Text(viewModel.watchlistReversed[index].name!, style: context.textTheme.bodyText1),
          Spacer(),
          GestureDetector(
              onTap: () {
                viewModel.deleteWatchlist(viewModel.watchlistReversed[index]);
              },
              child: Icon(Icons.delete, color: context.customColors.azure))
        ],
      ),
    );
  }
}
