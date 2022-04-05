import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation_manager.dart';
import '../theme/app_theme.dart';
import 'theme_notifier.dart';

class ApplicationProvider extends AppTheme {
  ApplicationProvider.provider();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      lazy: true,
    ),
    Provider.value(value: NavigationManager.instance)
  ];

  // List<SingleChildWidget> uiChangesItems = [
  //   ChangeNotifierProvider(
  //     create: (context) => UINotifier(),
  //     lazy: true,
  //   ),
  // ];
}
