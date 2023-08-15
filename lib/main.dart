import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Core/Language/app_languages.dart';
import 'Core/Language/locales.dart';
import 'Utilities/git_it.dart';
import 'Utilities/my_custom_scrolling.dart';
import 'Utilities/router_config.dart';

const bool enableMediumScreens = false;
const bool enableSmallScreens = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();

  await GitIt.initGitIt();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
      // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
    ],
    child: const EntryPoint(),
  ));
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  static Size largeSize = const Size(1920, 1080);
  static Size mediumSize = const Size(1000, 780);
  static Size smallSize = const Size(375, 812);

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    appLan.fetchLocale();
    return LayoutBuilder(
      builder: (context, constraints) {
        Size appSize = largeSize;
        if (constraints.maxWidth <= 768) {
          if (enableSmallScreens) appSize = smallSize;
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth > 768) {
          if (enableMediumScreens) appSize = mediumSize;
        } else {
          appSize = largeSize;
        }
        return ScreenUtilInit(
          designSize: appSize,
          builder: (_, __) => MaterialApp.router(
            scrollBehavior: MyCustomScrollBehavior(),
            routerConfig: GoRouterConfig.router,
            // theme: ThemeData(fontFamily: "Alexandria"),
            debugShowCheckedModeBanner: false,
            title: 'Coops News Dashboard',
            locale: Locale(appLan.appLang.name),
            supportedLocales:
                Languages.values.map((e) => Locale(e.name)).toList(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
