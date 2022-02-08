import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/bottom_sheet/modal_bottom_sheet_container.dart';
import 'package:movies_catalog/core/components/widgets/divider/custom_divider.dart';
import 'package:movies_catalog/core/components/widgets/text_form_field/custom_text_form_field.dart';
import 'package:movies_catalog/core/constants/image/image_path_svg.dart';
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
          child: model.watchlistReversed.isEmpty
              ? Center(child: Text('Create a Watchlist', style: context.textTheme.bodyText1))
              : Column(
                  children: [buildCreateWatchlist(model, context), buildListView(model)],
                )),
    );
  }

  Row buildCreateWatchlist(WatchListViewModel model, BuildContext context) {
    return Row(
      children: [
        buildCreateButton(model, context),
        context.sizedBoxLowHorizontal,
        buildTextFormField(context, model),
      ],
    );
  }

  Widget buildCreateButton(WatchListViewModel viewModel, BuildContext context) {
    return GestureDetector(
      onTap: () => viewModel.createWatchList(),
      child: SvgPicture.asset(
        SVGImagePaths.instance!.plus,
        color: context.customColors.azure,
        height: 28.h,
      ),
    );
  }

  Widget buildTextFormField(BuildContext context, WatchListViewModel viewModel) {
    return Expanded(
      child: CustomTextFormField(
        controller: viewModel.watchlistController,
        labelText: 'Create Watchlist',
        focusNode: viewModel.watchlistFocus,
        onFieldSubmitted: (value) {
          viewModel.unfocusKeyboard();
        },
      ),
    );
  }

  Widget buildListView(WatchListViewModel model) {
    return Expanded(child: Observer(
      builder: (_) {
        return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return CustomDivider(context: context);
            },
            itemCount: model.watchlistReversed.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  model.addMovieToWatchList(movie, model.watchlistReversed[index].name!, context);
                },
                child: Padding(
                  padding: context.paddingNormalVertical,
                  child: Text(model.watchlistReversed[index].name!, style: context.textTheme.bodyText1),
                ),
              );
            });
      },
    ));
  }
}
