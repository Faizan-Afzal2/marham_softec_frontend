import 'package:flutter/material.dart';
import 'package:marham_softec/features/Auth/model/controller/auth_controller.dart';
import 'package:marham_softec/features/addTask/view/controllers/add_task_by_text_controller.dart';
import 'package:marham_softec/services/local_storage_service.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme.dart';
import 'core/routing/router.dart';
import 'providers/theme_provider.dart';
import 'services/dialog_service.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(
            create: (_) => AddTaskByTextController()..loadCategories()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            scaffoldMessengerKey: DialogService.messengerKey,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
          );
        },
      ),
    );
  }
}
