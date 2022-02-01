import 'package:flutter/material.dart';

import '../../core/constants/navigation/homsecreen_constants.dart';


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
      bottomNavigationBar: _buildBottomNavigationBar,
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

  BottomNavigationBar get _buildBottomNavigationBar {
    return BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: _bottomNavigationItems);
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      pageIndex = selectedIndex;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavigationItems = [
   const BottomNavigationBarItem(
      icon:  Icon(Icons.settings),
      label: '1',
    ),
   const BottomNavigationBarItem(
      icon:  Icon(Icons.settings),
      label: '2',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
