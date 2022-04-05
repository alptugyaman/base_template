import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: () => _tabs(),
    );
  }

  Widget _tabs() {
    return Scaffold(
      body: _observer(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _observer() {
    return Observer(
      builder: (context) {
        return viewModel.children[viewModel.currentIndex];
      },
    );
  }

  Widget _bottomNavigationBar() {
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          selectedItemColor: themeData.colorScheme.primary,
          selectedLabelStyle: TextStyle(color: themeData.primaryColor),
          unselectedItemColor: Colors.grey.shade500,
          type: BottomNavigationBarType.fixed,
          onTap: viewModel.onTabTapped,
          currentIndex: viewModel.currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.offline_bolt),
              label: 'offline_bolt',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dangerous),
              label: 'dangerous',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'face',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kayaking),
              label: 'kayaking',
            ),
          ],
        );
      },
    );
  }
}
