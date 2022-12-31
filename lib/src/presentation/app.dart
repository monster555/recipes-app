import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/core/styles/color_schemes.g.dart';
import 'package:recipes_app/src/core/styles/custom_color.g.dart';
import 'package:recipes_app/src/data/repositories/recipe_repository_impl.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/bloc/settings/settings_cubit.dart';
import 'package:recipes_app/src/presentation/pages/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (_) => SettingsCubit(),
        ),
        BlocProvider<RecipesCubit>(
          create: (_) => RecipesCubit(
            repository: RecipesRepositoryImplementation(),
          ),
        ),
      ],
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          ColorScheme lightScheme;
          ColorScheme darkScheme;

          if (lightDynamic != null && darkDynamic != null) {
            lightScheme = lightDynamic.harmonized();
            lightCustomColors = lightCustomColors.harmonized(lightScheme);

            // Repeat for the dark color scheme.
            darkScheme = darkDynamic.harmonized();
            darkCustomColors = darkCustomColors.harmonized(darkScheme);
          } else {
            // Otherwise, use fallback schemes.
            lightScheme = lightColorScheme;
            darkScheme = darkColorScheme;
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightScheme,
              extensions: [lightCustomColors],
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkScheme,
              extensions: [darkCustomColors],
            ),
            home: const Home(),
            builder: (BuildContext context, Widget? widget) => MediaQuery(
              data: MediaQuery.of(context) // Override device text scale factor
                  .copyWith(textScaleFactor: 1, devicePixelRatio: 1),
              child: widget!,
            ),
          );
        },
      ),
    );
  }
}
