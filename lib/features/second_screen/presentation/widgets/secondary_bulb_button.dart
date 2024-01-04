// Project: Cubit Example
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20231005113334
// 05.10.2023 11:33
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/mixin/bulb_button_handler_mixin.dart';

/// A secondary button widget for controlling a bulb in the application.
///
/// This widget is a `ConsumerWidget` that uses `BulbButtonHandlerMixin`
/// for handling bulb-related actions. When the button is pressed,
/// it not only triggers the bulb action but also navigates back to the previous screen.
///
/// This widget is suitable for use in scenarios where an action on the bulb
/// needs to be followed by a navigation event, such as closing a dialog
/// or returning from a settings page.
///
/// The button presents itself as an `ElevatedButton` with a label 'Click me',
/// indicating an actionable item.
///
/// Usage:
/// This widget can be placed in parts of the UI where a bulb control action
/// is coupled with a navigation action (like closing a modal or returning from a screen).
///
/// Example:
/// ```dart
/// SecondaryBulbButton()
/// ```
class SecondaryBulbButton extends ConsumerWidget with BulbButtonHandlerMixin {
  /// Creates a secondary button for bulb control and navigation.
  ///
  /// The [key] argument is passed to the `super` constructor of `ConsumerWidget`.
  const SecondaryBulbButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The button, when pressed, executes `bulbHandler` from the mixin for
    // handling the bulb-related logic, and then navigates back using
    // `Navigator.pop(context)` to return to the previous screen.
    return ElevatedButton(
      onPressed: () {
        bulbHandler(ref);
        Navigator.pop(context);
      },
      child: const Text('Click me'),
    );
  }
}

