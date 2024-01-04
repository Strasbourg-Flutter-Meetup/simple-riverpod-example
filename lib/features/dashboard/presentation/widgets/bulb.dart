// Project: Cubit Example
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20231005094420
// 05.10.2023 09:44

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/dashboard/presentation/provider/bulb_provider.dart';
import 'package:riverpod_example/features/dashboard/presentation/provider/bulb_state.dart';
import 'package:riverpod_example/state_template/state_template.dart';
import 'package:riverpod_example/ui/widgets/center_template.dart';
import 'package:riverpod_example/ui/widgets/error_message.dart';
import 'package:riverpod_example/ui/widgets/loading_cycle.dart';

/// A widget representing the visual state of a bulb in the application.
///
/// This widget is a `ConsumerWidget` that listens to changes in a provider
/// (specifically, `bulbProvider`) and rebuilds whenever the provider's state changes.
/// It displays different UI elements based on the current state of the bulb,
/// allowing for a dynamic and responsive user experience.
///
/// The UI changes according to the following states:
/// - `initial`: Triggers bulb initialization and displays a loading animation.
/// - `loading`: Displays a loading animation.
/// - `error`: Shows an error message.
/// - `loaded`: Displays the current state of the bulb (on or off).
class Bulb extends ConsumerWidget {
  /// Creates a Bulb widget.
  ///
  /// The [key] argument is passed to the `super` constructor of `ConsumerWidget`.
  const Bulb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bulbProvider);

    switch (state.type) {
      case StateTemplateType.initial:
        // Trigger initialization of the bulb state when in the initial state.

        // In the context of the StateTemplate concept, where we want to initialize
        // state right after the widget build, Future.microtask is generally a
        // better choice over WidgetsBinding.instance.addFrameCallBack.
        // It will ensure the initialization code runs immediately
        // after the build method's execution, avoiding potential issues with
        // rendering but not waiting for the next frame.
        //
        // However, everytime when the initial state is called the initialize
        // method is executed. To prevent that, the initial state is just called
        // when initializing the StateNotifier.
        //
        // E. g.
        //
        // final bulbProvider = StateNotifierProvider<BulbStateNotifier, BulbState>(
        //     (ref) => BulbStateNotifier(
        //           const BulbState.initial(),
        //         ));
        //
        Future.microtask(() => ref.read(bulbProvider.notifier).initialize());
        return const CenterTemplate(child: LoadingCycle());
      // Fall through to loading state for UI consistency.
      case StateTemplateType.loading:
        // Display a loading indicator during the loading state.
        return const CenterTemplate(child: LoadingCycle());

      case StateTemplateType.error:
        // Display an error message when in the error state.
        return const CenterTemplate(child: ErrorMessage());

      default:
        // Build and display the content based on the current state data.
        return _buildBulbContent(state);
    }
  }

  /// Builds the content of the Bulb widget based on the current [BulbState].
  ///
  /// This method returns a widget that displays a message indicating whether
  /// the bulb is on or off, based on the [stateData] provided.
  /// If [stateData] is null, an error message is displayed.
  ///
  /// [state]: The current state of the bulb.
  Widget _buildBulbContent(BulbState state) {
    final stateData = state.data;

    if (stateData == null) {
      return const CenterTemplate(child: ErrorMessage());
    }

    return Center(
      child: Text(stateData.bulbIsOn ? 'Bulb is on!' : 'Bulb is off!'),
    );
  }
}
