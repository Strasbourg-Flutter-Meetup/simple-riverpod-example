// Project: Riverpod Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240104090703
// 04.01.2024 09:07
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/dashboard/presentation/provider/bulb_state.dart';
import 'package:riverpod_example/mixin/state_data_updater_mixin.dart';
import 'package:riverpod_example/mixin/state_template_handler_mixin.dart';

/// A provider for managing the state of a bulb feature.
///
/// It uses `BulbStateNotifier` to handle state changes and
/// provide the current state of the bulb to its consumers.
final bulbProvider = StateNotifierProvider<BulbStateNotifier, BulbState>(
  (ref) => BulbStateNotifier(
    const BulbState.initial(),
  )..initialize(),
);

/// A [StateNotifier] that manages the state of a bulb.
///
/// This class provides methods to initialize the bulb state,
/// and to switch the bulb on or off. It handles the state internally
/// and updates it accordingly using the [BulbState] class.
class BulbStateNotifier extends StateNotifier<BulbState>
    with
        StateTemplateHandlerMixin<BulbStateData>,
        StateDataUpdaterMixin<BulbStateData> {
  BulbStateNotifier(super._state);

  /// The current state data representing the bulb's state.
  @override
  BulbStateData stateData = const BulbStateData(bulbIsOn: false);

  /// Internal flag to track the on/off state of the bulb.
  bool _bulbIsOn = false;

  /// Initializes the bulb state.
  ///
  /// It sets up initial state data and updates the state to [BulbState.initialized].
  void initialize() {
    setInitialized(data: stateData);
  }

  /// Switches the bulb on.
  ///
  /// It sets the internal flag to true, updates the state data,
  /// and then updates the state to reflect the bulb is on.
  /// If an error occurs, it sets the state to [BulbState.error].
  void switchBulbOn() {
    try {
      setLoading();
      _bulbIsOn = true;

      updateStateData();
      setLoaded(data: stateData);
    } catch (e) {
      setError();
    }
  }

  /// Switches the bulb off.
  ///
  /// It sets the internal flag to false, updates the state data,
  /// and then updates the state to reflect the bulb is off.
  /// If an error occurs, it sets the state to [BulbState.error].
  void switchBulbOff() {
    try {
      setLoading();

      _bulbIsOn = false;

      updateStateData();

      setLoaded(data: stateData);
    } catch (e) {
      setError();
    }
  }

  @override
  void updateStateData() {
    stateData = BulbStateData(bulbIsOn: _bulbIsOn);
  }
}

