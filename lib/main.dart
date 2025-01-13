import 'package:flutter/material.dart';


import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';
import 'presentation/providers/theme-changer/theme_changer_provider.dart';

Future<void> main() async{

  await dotenv.load(fileName: '.env');

  runApp(
    const ProviderScope(child: MainlyApp() )
  );
}

class MainlyApp extends ConsumerWidget {
  const MainlyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 

    final AppTheme appTheme = ref.watch(themeNotifierProvider);


    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getThemeApp(),
    );
  }
}
