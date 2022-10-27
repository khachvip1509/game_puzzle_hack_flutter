import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_puzzle_hack_flutter/src/domain/models/move_to.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/background.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/game_app_bar.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/game_buttons.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/puzzle_interactor.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/puzzle_options.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/time_and_moves.dart';
import 'package:game_puzzle_hack_flutter/src/ui/pages/game/widgets/winner_dialog.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories_impl/images_repository_impl.dart';
import '../../../domain/models/puzzle_image.dart';
import '../../utils/responsive.dart';
import 'controller/game_controller.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

    @override
    State<GameView> createState() => _GameViewState();

}
class _GameViewState extends State<GameView> {
  bool isShow = false;
  String pathImage= "";
  void _onKeyBoardEvent(BuildContext context, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final moveTo = event.logicalKey.keyLabel.moveTo;
      if (moveTo != null) {
        context.read<GameController>().onMoveByKeyboard(moveTo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final width = responsive.width;
    return ChangeNotifierProvider(
      create: (_) {
        final controller = GameController();
        controller.onFinish.listen(
              (_) {
            Timer(
              const Duration(
                milliseconds: 200,
              ),
                  () {
                showWinnerDialog(
                  context,
                  moves: controller.state.moves,
                  time: controller.time.value,
                );
              },
            );
          },
        );
        return controller;
      },
      builder: (context, child) => RawKeyboardListener(
        autofocus: true,
        includeSemantics: false,
        focusNode: FocusNode(),
        onKey: (event) => _onKeyBoardEvent(context, event),
        child: child!,
      ),
      child: GameBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: OrientationBuilder(
              builder: (_, orientation) {
                final isPortrait = orientation == Orientation.portrait;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameAppBar(callback:(path){
                      pathImage= path;
                      puzzleOptions.add(
                          PuzzleImage(
                            name: "ken",
                            assetPath: path,
                            soundPath: '',)
                      );
                      setState(() {

                      });
                     }),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          final height = constraints.maxHeight;
                          final puzzleHeight =
                          (isPortrait ? height * 0.45 : height * 0.5)
                              .clamp(250, 700)
                              .toDouble();
                          final optionsHeight =
                          (isPortrait ? height * 0.25 : height * 0.2)
                              .clamp(120, 200)
                              .toDouble();

                          return SizedBox(
                            height: height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: optionsHeight,
                                    child: PuzzleOptions(
                                      width: width,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.1,
                                  ),
                                  const TimeAndMoves(),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: puzzleHeight,
                                      child: const AspectRatio(
                                        aspectRatio: 1,
                                        child: PuzzleInteractor(),
                                      ),
                                    ),
                                  ),
                                  const GameButtons(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
