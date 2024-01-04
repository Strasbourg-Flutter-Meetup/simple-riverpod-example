// Project: Cubit Example
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Walnut IT 2023
// ID: 20231005094046
// 05.10.2023 09:40
import 'package:flutter/material.dart';
import 'package:riverpod_example/features/dashboard/presentation/widgets/bulb.dart';
import 'package:riverpod_example/features/dashboard/presentation/widgets/primary_bulb_button.dart';
import 'package:riverpod_example/features/dashboard/presentation/widgets/router_button.dart';
import 'package:riverpod_example/ui/widgets/screen_template.dart';

/// The Dashboard screen of the application.
///
/// This stateless widget represents the dashboard screen
/// where various widgets related to the bulb feature are displayed.
/// It's a central place where users can interact with the bulb feature.
///
/// The layout of this screen includes:
/// - A top space for aesthetic spacing.
/// - The [Bulb] widget that visually represents the state of a bulb.
/// - A button [PrimaryBulbButton] to toggle the state of the bulb.
/// - A [RouterButton] that might be used for navigation purposes.
class Dashboard extends StatelessWidget {
  /// Creates a Dashboard screen.
  ///
  /// The [key] argument is passed to the `super` constructor of `StatelessWidget`.
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilizes `ScreenTemplate` to maintain a consistent layout structure.
    return const ScreenTemplate(
      widget: Column(
        children: [
          SizedBox(
            height: 96.0,
          ),
          Bulb(),
          SizedBox(
            height: 96.0,
          ),
          PrimaryBulbButton(),
          SizedBox(
            height: 24.0,
          ),
          RouterButton(),
        ],
      ),
    );
  }
}
