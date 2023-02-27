import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../../theme/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = controller.downloaderConfig.value;
    return GetMaterialApp.router(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        theme: GopeedTheme.light,
        darkTheme: GopeedTheme.dark,
        themeMode: ThemeMode.values.byName(config.extra.themeMode),
        // translations: messages,
        // translationsKeys: AppTranslation.translations,
        // locale: toLocale(config.extra.locale),
        // fallbackLocale: fallbackLocale,

        // onGenerateTitle: (context) => AppLocalizations.of(context).title,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        // localize your device app description

        getPages: AppPages.routes,
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              // maxWidth: 1200,
              minWidth: 375,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(375, name: MOBILE),
                // const ResponsiveBreakpoint.autoScale(768, name: TABLET),
                const ResponsiveBreakpoint.resize(1024, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
            ));
  }
}
