import 'package:flutter/material.dart';
import 'package:game_puzzle_hack_flutter/src/ui/routes/routes.dart';

import '../pages/game/game_view.dart';
import '../pages/privacy/privacy_view.dart';
import '../pages/splash/splash_view.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (_) => const SplashView(),
    Routes.game: (_) => const GameView(),
    Routes.privacy: (_) => const PrivacyView(),
  };
}
