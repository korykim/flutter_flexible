import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:provider/provider.dart';
import 'routes/onGenerateRoute.dart';
import 'routes/routesInit.dart'; // 路由配置
import 'providers_config.dart'; // providers配置文件
import 'provider/themeStore.p.dart'; // 全局主题

void main() {
  jhDebugMain(
    appChild: MultiProvider(
      providers: providersConfig,
      child: MyApp(),
    ),
    debugMode: DebugMode.inConsole,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeStore>(
      builder: (context, themeStore, child) {
        return MaterialApp(
          navigatorKey: jhDebug.getNavigatorKey,
          locale: Locale('zh', 'CH'),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('zh', 'CH'),
            // const Locale('en', 'US'), // English
          ],
          theme: themeStore.getTheme,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute, // 路由处理
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
