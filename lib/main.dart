import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/bloc/order_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/bloc/cart_bloc.dart';

import 'core/injectable/injection.dart';
import 'core/route/app_route.dart';
import 'core/theme/app_theme.dart';
import 'features/storefront/presentation/bloc/storefront_bloc.dart';
import 'features/storefront/presentation/cubit/store_information_cubit.dart';
import 'features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'features/storefront/presentation/pages/order_details/mobile/cubit/app_cubit.dart';
import 'firebase_options.dart';

void main() async {
  // setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase in app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureInjection(Environment.dev);
  // var fcmToken = await FirebaseMessaging.instance.getToken();
  // print("FCM Token: $fcmToken");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final BeamerDelegate delegate = DesktopRoute().routerDelegate;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StorefrontBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<StoreInformationCubit>(
          create: (context) => getIt(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<AppLocationCubit>(
          create: (context) => AppLocationCubit(),
        )
      ],
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: "Storefront | Home",
        theme: StoreTheme.lightTheme,
        // darkTheme: StoreTheme.darkTheme,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: delegate,
          alwaysBeamBack: true,
        ),
        routerDelegate: delegate,
      ),
    );
  }
}
