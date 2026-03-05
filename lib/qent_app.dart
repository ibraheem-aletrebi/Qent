import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/cubits/language_cubit/language_state.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/cubits/theme_cubit/theme_state.dart';
import 'package:quent/core/resources/theme.dart';
import 'package:quent/core/routing/route_configration.dart';
import 'package:quent/generated/l10n.dart';

class QentApp extends StatelessWidget {
  const QentApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(430, 930),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) => GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: MaterialApp(
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Locale(state.languageCode),
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: context.read<ThemeCubit>().isDarkMode
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  initialRoute: RouteConfigration().getInitialRoute(),
                  onGenerateRoute: RouteConfigration().onGenerateRoute,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
