// Project: Riverpod Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240104090703
// 04.01.2024 09:07
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/dashboard/presentation/provider/bulb_state.dart';

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
class BulbStateNotifier extends StateNotifier<BulbState> {
  BulbStateNotifier(super._state);

  /// Internal field to hold the state data.
  BulbStateData? _stateData;

  /// Internal flag to track the on/off state of the bulb.
  bool _bulbIsOn = false;

  /// Initializes the bulb state.
  ///
  /// It sets up initial state data and updates the state to [BulbState.initialized].
  void initialize() {
    _updateStateData();
    state = BulbState.initialized(data: _stateData);
  }

  /// Switches the bulb on.
  ///
  /// It sets the internal flag to true, updates the state data,
  /// and then updates the state to reflect the bulb is on.
  /// If an error occurs, it sets the state to [BulbState.error].
  void switchBulbOn() {
    try {
      _loading();
      _bulbIsOn = true;

      _updateStateData();
      _loaded();
    } catch (e) {
      _error();
    }
  }

  /// Switches the bulb off.
  ///
  /// It sets the internal flag to false, updates the state data,
  /// and then updates the state to reflect the bulb is off.
  /// If an error occurs, it sets the state to [BulbState.error].
  void switchBulbOff() {
    try {
      _loading();

      _bulbIsOn = false;

      _updateStateData();

      _loaded();
    } catch (e) {
      _error();
    }
  }

  /// Sets the state to [BulbState.loading] with the previous data.
  void _loading() {
    state = BulbState.loading(previousData: _stateData);
  }

  /// Sets the state to [BulbState.loaded] with the current state data.
  void _loaded() {
    state = BulbState.loaded(data: _stateData);
  }

  /// Sets the state to [BulbState.error] in case of an error.
  void _error() {
    state = const BulbState.error();
  }

  /// Updates the [_stateData] based on the current [_bulbIsOn] value.
  void _updateStateData() {
    _stateData = BulbStateData(bulbIsOn: _bulbIsOn);
  }
}
