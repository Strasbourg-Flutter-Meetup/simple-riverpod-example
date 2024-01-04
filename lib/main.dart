import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/dashboard/presentation/screen/dashboard.dart';

/// The root widget of the application.
///
/// This class builds and configures the MaterialApp, which serves as the top-level
/// widget for the entire application. It defines the application's title, theme,
/// and the initial screen to be displayed.
class MyApp extends StatelessWidget {
  /// Creates the MyApp widget.
  ///
  /// The [key] argument is passed to the `super` constructor of `StatelessWidget`.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The title of the application, displayed in the device's app switcher.
      title: 'Simple Riverpod Example',

      // The theme configuration for the entire application. Here, it sets
      // the color scheme to use deep purple as the primary color and enables
      // Material 3 design components.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // The initial screen to be displayed when the app is launched, which
      // is set to the `Dashboard` widget.
      home: const Dashboard(),
    );
  }
}

void main() {
  // Initializes and runs the Flutter application.
  //
  // `ProviderScope` is used to wrap the root widget, `MyApp`, to ensure that
  // the Riverpod state management functionality is available throughout the
  // entire application.
  runApp(const ProviderScope(child: MyApp()));
}
