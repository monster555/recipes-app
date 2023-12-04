import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/core/styles/color_schemes.g.dart';
import 'package:recipes_app/src/core/styles/custom_color.g.dart';
import 'package:recipes_app/src/core/styles/styles.dart';
import 'package:recipes_app/src/data/repositories/recipe_repository_impl.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/pages/home/home.dart';

/// The root widget of the application.
///
/// This widget is responsible for setting up the application theme, creating a
/// [MultiBlocProvider] with a single [RecipesCubit], and wrapping the
/// [MaterialApp] with a [DynamicColorBuilder].
/// It also overrides the device's text scale factor to ensure consistent
/// text sizes across devices.

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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

          // If both light and dark color schemes are available, harmonize them.
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

          // Build the [MaterialApp] with the dynamic color schemes and
          // overridden text scale factor.
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(lightScheme),
            darkTheme: AppTheme.darkTheme(darkScheme),
            home: const Home(),
            builder: (BuildContext context, Widget? widget) => MediaQuery(
              data: MediaQuery.of(context)
                  // Override device text scale factor
                  .copyWith(
                devicePixelRatio: 1,
                textScaler: const TextScaler.linear(1),
              ),
              child: widget!,
            ),
          );
        },
      ),
    );
  }
}
