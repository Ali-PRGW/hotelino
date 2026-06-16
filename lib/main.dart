import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/features/home/data/repositories/profile_repository.dart';
import 'package:hotelino/features/home/logic/providers/favorite_item_provider.dart';
import 'package:hotelino/features/home/logic/providers/home_provider.dart';
import 'package:hotelino/features/home/logic/providers/profile_provider.dart';
import 'package:hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:hotelino/features/onboarding/logic/providers/onboarding_provider.dart';
import 'package:hotelino/lazy_bootstrap.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:hotelino/shared/services/json_data_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  final hotelRepository = HotelRepository(jsonDataService: JsonDataService());


  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await LazyBootstrap();
  FlutterNativeSplash.remove();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider(WidgetsBinding.instance.platformDispatcher.platformBrightness)),
    ChangeNotifierProvider(create: (_) => OnboardingProvider(OnboardingRepository())),
    ChangeNotifierProvider(create: (_) => HomeProvider(hotelRepository)),
    ChangeNotifierProvider(create: (_) => ProfileProvider(ProfileRepository() , hotelRepository)),
    ChangeNotifierProvider(create: (_) => FavoriteItemProvider(hotelRepository)),

  ]
  ,
  child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

  @override
  void initState(){
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

    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(context , listen: false).updateTheme(brightness);
  }

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvider, child) {
        return SafeArea(
          top: false,
          child: MaterialApp(
            title: 'Hotelino',
            debugShowCheckedModeBanner: false,
            theme: themeModeProvider.brightness == Brightness.light ? AppTheme.lightTheme : AppTheme.darkTheme,
            routes: AppRoute.routes,
            initialRoute: AppRoute.onboarding,
          ),
        );
      } ,
    );
  }
}

