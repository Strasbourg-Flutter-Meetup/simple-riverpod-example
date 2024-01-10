// Project: Riverpod Example
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240104112750
// 04.01.2024 11:27
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state_template/state_template.dart';

/// A mixin providing utility methods to handle state transitions for
/// [StateNotifier] objects using [StateTemplate<T>].
///
/// This mixin adds methods to easily transition between different states
/// of a [StateNotifier] that uses [StateTemplate<T>] as its state. It provides
/// a standardized way to update the state to loading, loaded, error, or initialized,
/// simplifying the management of state transitions in the application.
///
/// Usage:
/// Include this mixin in any [StateNotifier] class that uses [StateTemplate<T>]
/// as its state type. This allows you to leverage predefined methods to update
/// the state of your notifier in a consistent and reusable manner.
///
/// Example:
/// ```dart
/// class MyStateNotifier extends StateNotifier<StateTemplate<MyDataType>>
///     with StateTemplateHandlerMixin<MyDataType> {
///   MyStateNotifier() : super(const StateTemplate.initial());
///
///   void fetchData() {
///     setLoading();
///     try {
///       final data = // fetch data logic;
///       setLoaded(data: data);
///     } catch (e) {
///       setError();
///     }
///   }
/// }
/// ```
mixin StateTemplateHandlerMixin<T> on Notifier<StateTemplate<T>> {
  /// Updates the state to [StateTemplateType.loading], optionally using [previousData].
  ///
  /// Use this method to indicate that a loading process has started.
  /// [previousData] can be used to maintain the previous state's data if necessary.
  void setLoading({T? previousData}) {
    state = StateTemplate<T>.loading(previousData: previousData);
  }

  /// Updates the state to [StateTemplateType.loaded] with the provided [data].
  ///
  /// Use this method to update the state to indicate that data has been successfully loaded.
  /// [data] is required and represents the newly loaded data.
  void setLoaded({required T data}) {
    state = StateTemplate<T>.loaded(data: data);
  }

  /// Updates the state to [StateTemplateType.error].
  ///
  /// Use this method to set the state to an error condition, indicating that an error has occurred.
  void setError() {
    state = StateTemplate<T>.error();
  }

  /// Updates the state to [StateTemplateType.initialized] with optional [data].
  ///
  /// Use this method to initialize the state. [data] can be provided to initialize the state
  /// with specific data.
  void setInitialized({T? data}) {
    state = StateTemplate<T>.initialized(data: data);
  }

  /// Initializes the state.
  ///
  /// It should be used to return the StateTemplate<T>.initial() state.
  dynamic initialize();
}
