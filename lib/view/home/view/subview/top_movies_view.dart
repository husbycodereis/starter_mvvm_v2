import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
import 'package:movies_catalog/core/constants/app/text_constants.dart';
import 'package:movies_catalog/core/constants/image/image_path_svg.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';
import 'package:movies_catalog/view/home/viewmodel/home_view_model.dart';

class TopMoviesView extends StatelessWidget {
  const TopMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onDispose: (model) => model.dispose(),
      onPageBuilder: (HomeViewModel model) => Scaffold(
          appBar: buildAppBar(context),
          body: Observer(
            builder: (_) {
              return model.loading ? const BasicLoadingWidget() : buildGridView(context, model);
            },
          )),
    );
  }

  Padding buildGridView(BuildContext context, HomeViewModel model) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: GridView.builder(
          controller: model.movieScrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 28.h,
            childAspectRatio: 0.6,
          ),
          itemCount: model.topMoviesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => model.navigateToDetails(model.topMoviesList[index]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: context.bordernormalRadius,
                      child: Image.network(
                        model.topMoviesList[index].fullImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    model.topMoviesList[index].title!.length > 20
                        ? '${model.topMoviesList[index].title!.substring(0, 20)}...'
                        : model.topMoviesList[index].title ?? TextConstants.movie_no_title,
                    style: context.textTheme.bodyText2,
                  )
                ],
              ),
            );
          }),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGImagePaths.instance!.cameraSVG,
            width: 23.w,
            color: context.brightness == Brightness.dark ? context.customColors.white : context.customColors.darkBlue,
          ),
          SizedBox(width: 15.w),
          Text(
            TextConstants.movie_manager,
            style: context.textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
