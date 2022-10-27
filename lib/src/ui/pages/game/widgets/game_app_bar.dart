import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_puzzle_hack_flutter/constants/callbacks.dart';
import 'package:game_puzzle_hack_flutter/src/ui/utils/dark_mode_extension.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../take_picture/take_picture.dart';
import '../../../global/controllers/theme_controller.dart';
import '../../../global/widgets/my_icon_button.dart';
import '../../../icons/puzzle_icons.dart';
import '../../../routes/routes.dart';
import '../../../utils/platform.dart';
import '../controller/game_controller.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

const whiteFlutterLogoColorFilter = ColorFilter.matrix(
  [1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0],
);

class GameAppBar extends StatefulWidget {
   GameAppBar({Key? key, this.callback}) : super(key: key);
  String? newImage ="";
  CallbackActionString? callback;

   @override
   State<GameAppBar> createState() => _GameAppBarState();



}

class _GameAppBarState extends State<GameAppBar>{

  @override
  Widget build(BuildContext context) {
    final logo = isIOS
        ? const Icon(
      PuzzleIcons.heart,
      color: Colors.redAccent,
      size: 30,
    )
        : const FlutterLogo(
      size: 40,
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          children: [
            FittedBox(
              child: Text.rich(
                TextSpan(
                  text: "${isIOS ? "Created" : "Powered"}\n",
                  children: const [
                    TextSpan(
                      text: "Ken",
                      style: TextStyle(
                        fontSize: 24,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 5),
            // if (context.isDarkMode)
            //   ColorFiltered(
            //     colorFilter: whiteFlutterLogoColorFilter,
            //     child: logo,
            //   )
            // else
            logo,
            const Spacer(),
            GestureDetector(onTap: (){
              //Get.toNamed(Routes.takePhoto);
              // Get.to(TakePictureView(callbackData: (xFile){
              //   //updateImage(xFile);
              //
              // }
              // ,callback: (data){
              //
              //    widget.newImage = data;
              //   setState(() {
              //     widget.callback!(widget.newImage??"");
              //   });
              // }),
              // );
            },
              child:  Image.asset("assets/images/dash.png", width: 50,height: 50,)),
            Consumer<GameController>(
              builder: (_, controller, __) => Row(
                children: [
                  MyIconButton(
                    onPressed: controller.toggleVibration,
                    iconData: controller.state.vibration
                        ? PuzzleIcons.vibration
                        : PuzzleIcons.vibration_off,
                  ),
                  const SizedBox(width: 10),
                  MyIconButton(
                    onPressed: controller.toggleSound,
                    iconData: controller.state.sound
                        ? PuzzleIcons.sound
                        : PuzzleIcons.mute,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Consumer<ThemeController>(
              builder: (_, controller, __) => MyIconButton(
                onPressed: controller.toggle,
                iconData: controller.isDarkMode
                    ? PuzzleIcons.dark_mode
                    : PuzzleIcons.brightness,
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateImage (XFile xFile) async{
    final XFile? image =  await xFile;
    File imageFile = File(image!.path);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final fileName = Path.basename(imageFile.path);
    final File localImage =  await imageFile.copy('$appDocPath/$fileName');
    setState(() {
     // widget.newImage = localImage.path;
      // pickedImagePath= image.path;
    });
  }

}