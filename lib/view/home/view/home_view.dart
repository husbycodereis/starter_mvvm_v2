import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_catalog/core/constants/image/image_path_svg.dart';
import 'package:movies_catalog/core/extensions/context_extensions.dart';

import '../../../core/constants/navigation/homsecreen_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  late final PageController _pageController;
  late final List<Widget> _viewList;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _viewList = HomeScreenConstantsEnum.values.map((e) => e.rawValue).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageViewBody,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PageView get buildPageViewBody {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _viewList.length,
        itemBuilder: (context, index) {
          return _viewList[index];
        });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String imagePath,
    String name,
  ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
        child: SvgPicture.asset(
          imagePath,
          color: context.brightness == Brightness.dark ? context.customColors.white : context.customColors.darkGrey,
          height: 28.h,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
        child: SvgPicture.asset(
          imagePath,
          color: context.customColors.azure,
          height: 28.h,
        ),
      ),
      label: name,
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    final List<BottomNavigationBarItem> _bottomNavigationItems = [
      _buildBottomNavigationBarItem(SVGImagePaths.instance!.home, 'Home'),
      _buildBottomNavigationBarItem(SVGImagePaths.instance!.search, 'Search'),
      _buildBottomNavigationBarItem(SVGImagePaths.instance!.heart, 'Favorites'),
      _buildBottomNavigationBarItem(SVGImagePaths.instance!.list, 'Watchlist'),
      _buildBottomNavigationBarItem(SVGImagePaths.instance!.profile, 'Profile'),
    ];

    return BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: _onItemTapped,
        items: _bottomNavigationItems);
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      pageIndex = selectedIndex;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
