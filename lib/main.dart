import 'package:Hotelino/bootstrap.dart';
import 'package:Hotelino/core/theme/app_theme.dart';
import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repositories.dart';
import 'package:Hotelino/features/home/presentation/homeProvider.dart';
import 'package:Hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/routes/appRoutes.dart';
import 'package:Hotelino/shared/services/json_data_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await lazyBootstrap();
  FlutterNativeSplash.remove();

  final homeRepository = HotelRepositories(
    jsonDataServices: JsonDataServices(),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => ThemeProvider(
                WidgetsBinding.instance.platformDispatcher.platformBrightness,
              ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepository()),
        ),
        ChangeNotifierProvider(create: (_) => Homeprovider(homeRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).updateBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvider, child) {
        return MaterialApp(
          title: "Hotelino",
          debugShowCheckedModeBanner: false,
          theme:
              themeModeProvider.brightness == Brightness.light
                  ? AppTheme.lightTheme
                  : AppTheme.darkTheme,
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.onboarding,
        );
      },
    );
  }
}
