// Project: Riverpod Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240104095159
// 04.01.2024 09:51
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/dashboard/presentation/provider/bulb_provider.dart';

/// Mixin for handling bulb toggle actions in widgets.
///
/// This mixin provides a common method [bulbHandler] that can be used
/// by widgets to toggle the state of a bulb between on and off. It utilizes
/// the [bulbProvider] to read and manipulate the state of the bulb.
///
/// The [bulbHandler] method checks the current state of the bulb and
/// toggles it. If the bulb is on, it turns it off, and vice versa.
///
/// Usage:
/// Include this mixin in a widget class to provide the widget with the ability
/// to handle bulb toggle functionality. The widget can then call [bulbHandler]
/// to toggle the state of the bulb based on user interaction.
///
/// Example:
/// ```dart
/// class MyWidget extends ConsumerWidget with BulbButtonHandlerMixin {
///   @override
///   Widget build(BuildContext context, WidgetRef ref) {
///     return ElevatedButton(
///       onPressed: () => bulbHandler(ref),
///       child: Text('Toggle Bulb'),
///     );
///   }
/// }
/// ```
mixin BulbButtonHandlerMixin {
  /// Handles the toggling of the bulb's state.
  ///
  /// It checks the current state of the bulb and toggles it accordingly.
  /// If the bulb is currently on, it turns it off, and if it's off, it turns it on.
  ///
  /// [ref]: A [WidgetRef] to read and interact with the state of [bulbProvider].
  void bulbHandler(WidgetRef ref) {
    final state = ref.watch(bulbProvider);

    if (state.data?.bulbIsOn ?? false) {
      ref.read(bulbProvider.notifier).switchBulbOff();
    } else {
      ref.read(bulbProvider.notifier).switchBulbOn();
    }
  }
}

