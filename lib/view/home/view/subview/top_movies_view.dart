import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/base/view/base_view.dart';
import 'package:movies_catalog/core/components/widgets/loading/basic_loading_widget.dart';
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
      onPageBuilder: (HomeViewModel model) => Scaffold(
          appBar: buildAppBar(context),
          body: Observer(
            builder: (_) {
              return model.loading
                  ? BasicLoadingWidget()
                  : Padding(
                      padding: context.paddingNormalHorizontal,
                      child: GridView.builder(
                          controller: model.movieScrollController,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: model.topMoviesList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: context.bordernormalRadius,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: context.bordernormalRadius,
                                        child: Image.network(
                                          model.topMoviesList[index].fullImageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                  context.sizedBoxLowVertical,
                                  Text(
                                    model.topMoviesList[index].title!.length > 20
                                        ? '${model.topMoviesList[index].title!.substring(0, 20)}...'
                                        : model.topMoviesList[index].title ?? 'No Title Found',
                                    style: context.textTheme.bodyText2,
                                  )
                                ],
                              ),
                            );
                          }),
                    );
            },
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGImagePaths.instance!.cameraSVG,
            width: 23.w,
          ),
          SizedBox(width: 15.w),
          Text(
            'The Movie Manager',
            style: context.textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
