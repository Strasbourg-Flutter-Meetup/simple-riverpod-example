// Project: Cubit Example
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20231005094220
// 05.10.2023 09:42
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/mixin/provider_mixin.dart';

/// A primary button widget for controlling a bulb in the application.
///
/// This widget is a `ConsumerWidget` which utilizes `BulbButtonHandlerMixin`
/// to interact with the bulb-related functionality. When the button is pressed,
/// it triggers actions defined in the `BulbButtonHandlerMixin`.
///
/// The button uses an `ElevatedButton` for a standard raised-button style, making
/// it stand out as a primary action button. The text 'Click me' indicates the
/// interactivity of the button.
///
/// Usage:
/// Place this widget in any part of your UI where you need a button to control
/// the bulb.
///
/// Example:
/// ```dart
/// PrimaryBulbButton()
/// ```
class PrimaryBulbButton extends ConsumerWidget with BulbButtonHandlerMixin {
  /// Creates a primary button for bulb control.
  ///
  /// The [key] argument is passed to the `super` constructor of `ConsumerWidget`.
  const PrimaryBulbButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The button, when pressed, calls the `bulbHandler` method from the mixin.
    // This method is expected to contain the logic for toggling the bulb's state.
    return ElevatedButton(
      onPressed: () {
        bulbHandler(ref);
      },
      child: const Text('Click me'),
    );
  }
}
