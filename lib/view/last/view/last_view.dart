import 'package:base_template/core/extension/localization_extension.dart';
import 'package:base_template/core/init/language/language_manager.dart';
import 'package:base_template/core/init/language/locale_keys.g.dart';
import 'package:base_template/view/last/viewmodel/last_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';

class LastView extends StatefulWidget {
  @override
  _LastViewState createState() => _LastViewState();
}

class _LastViewState extends BaseState<LastView> {
  late LastViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LastViewModel>(
      viewModel: LastViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: () => _scaffold(),
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.some_wrong.locale),
      ),
      body: _body,
    );
  }

  Widget get _body => Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            _elements('English', LanguageManager.instance.enLocale),
            _elements('Türkçe', LanguageManager.instance.trLocale),
          ],
        ),
      );

  Widget _elements(String language, Locale locale) {
    return ListTile(
      title: Text(language),
      dense: true,
      onTap: () async {
        if (kDebugMode) {
          print(locale.languageCode);
        }
        await context.setLocale(locale);
        setState(() {});
      },
    );
  }
}
