import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';

import '../../domain/models/puzzle_image.dart';
import '../../domain/repositories/images_repository.dart';

var puzzleOptions = <PuzzleImage>[
  PuzzleImage(
    name: 'Numeric',
    assetPath: 'assets/images/numeric-puzzle.png',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  PuzzleImage(
    name: 'vk',
    assetPath: 'assets/animals/vk.png',
    soundPath: 'assets/sounds/cat.mp3',
  ),
  PuzzleImage(
    name: 'Family',
    assetPath: 'assets/animals/family.png',
    soundPath: 'assets/sounds/koala.mp3',
  ),
  PuzzleImage(
    name: 'ngocanh',
    assetPath: 'assets/animals/ngocanh.png',
    soundPath: 'assets/sounds/dog.mp3',
  ),
  PuzzleImage(
    name: 'han',
    assetPath: 'assets/animals/han.png',
    soundPath: 'assets/sounds/fox.mp3',
  ),
  PuzzleImage(
    name: 'giang',
    assetPath: 'assets/animals/giang.png',
    soundPath: 'assets/sounds/monkey.mp3',
  ),
  PuzzleImage(
    name: 'khoai',
    assetPath: 'assets/animals/khoai.png',
    soundPath: 'assets/sounds/mouse.mp3',
  ),
  PuzzleImage(
    name: 'maianh',
    assetPath: 'assets/animals/maianh.png',
    soundPath: 'assets/sounds/panda.mp3',
  ),
  PuzzleImage(
    name: 'chip',
    assetPath: 'assets/animals/chip.png',
    soundPath: 'assets/sounds/penguin.mp3',
  ),


  PuzzleImage(
    name: 'theanh',
    assetPath: 'assets/animals/theanh.jpg',
    soundPath: 'assets/sounds/pull-out.mp3',
  ),
  PuzzleImage(
    name: 'ngocanh4',
    assetPath: 'assets/animals/ngocanh4.jpg',
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'bo',
    assetPath: 'assets/animals/bo.jpg',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  PuzzleImage(
    name: 'ngocanh2',
    assetPath: 'assets/animals/ngocanh2.jpg',
    soundPath: 'assets/sounds/koala.mp3',
  ),

  PuzzleImage(
    name: 'nghe',
    assetPath: 'assets/animals/nghe.jpg',
    soundPath: 'assets/sounds/monkey.mp3',
  ),
  PuzzleImage(
    name: 'mechi',
    assetPath: 'assets/animals/mechi.jpg',
    soundPath: 'assets/sounds/fox.mp3',
  ),
  PuzzleImage(
    name: 'maianh4',
    assetPath: 'assets/animals/maianh4.jpg',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  PuzzleImage(
    name: 'maianh3',
    assetPath: 'assets/animals/maianh3.jpg',
    soundPath: 'assets/sounds/mouse.mp3',
  ),
  PuzzleImage(
    name: 'TramAnh',
    assetPath: 'assets/animals/tramanh.png',
    soundPath: 'assets/sounds/cat.mp3',
  ),
  PuzzleImage(
    name: 'khoai2',
    assetPath: 'assets/animals/khoai2.jpg',
    soundPath: 'assets/sounds/panda.mp3',
  ),
  PuzzleImage(
    name: 'giang2',
    assetPath: 'assets/animals/giang2.jpg',
    soundPath: 'assets/sounds/cat.mp3',
  ),
  PuzzleImage(
    name: 'cluu',
    assetPath: 'assets/animals/cluu.jpg',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  PuzzleImage(
    name: 'cacchi',
    assetPath: 'assets/animals/cacchi.jpg',
    soundPath: 'assets/sounds/tiger.mp3',
  ),PuzzleImage(
    name: 'cacchau2',
    assetPath: 'assets/animals/cacchau2.jpg',
    soundPath: 'assets/sounds/dog.mp3',
  ),
  PuzzleImage(
    name: 'maianh2',
    assetPath: 'assets/animals/maianh2.jpg',
    soundPath: 'assets/sounds/lion.mp3',
  ),


  PuzzleImage(
    name: 'Lion',
    assetPath: 'assets/animals/lion.jpg',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  // PuzzleImage(
  //   name: 'Cat',
  //   assetPath: 'assets/animals/cat.png',
  //   soundPath: 'assets/sounds/cat.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Dog',
  //   assetPath: 'assets/animals/dog.png',
  //   soundPath: 'assets/sounds/dog.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Fox',
  //   assetPath: 'assets/animals/fox.png',
  //   soundPath: 'assets/sounds/fox.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Koala',
  //   assetPath: 'assets/animals/koala.png',
  //   soundPath: 'assets/sounds/koala.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Monkey',
  //   assetPath: 'assets/animals/monkey.png',
  //   soundPath: 'assets/sounds/monkey.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Mouse',
  //   assetPath: 'assets/animals/mouse.png',
  //   soundPath: 'assets/sounds/mouse.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Panda',
  //   assetPath: 'assets/animals/panda.png',
  //   soundPath: 'assets/sounds/panda.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Penguin',
  //   assetPath: 'assets/animals/penguin.png',
  //   soundPath: 'assets/sounds/penguin.mp3',
  // ),
  // PuzzleImage(
  //   name: 'Tiger',
  //   assetPath: 'assets/animals/tiger.png',
  //   soundPath: 'assets/sounds/tiger.mp3',
  // ),
];

Future<Image> decodeAsset(ByteData bytes) async {
  return decodeImage(
    bytes.buffer.asUint8List(),
  )!;
}

class SPlitData {
  final Image image;
  final int crossAxisCount;

  SPlitData(this.image, this.crossAxisCount);
}

Future<List<Uint8List>> splitImage(SPlitData data) {
  final image = data.image;
  final crossAxisCount = data.crossAxisCount;
  final int length = (image.width / crossAxisCount).round();
  List<Uint8List> pieceList = [];

  for (int y = 0; y < crossAxisCount; y++) {
    for (int x = 0; x < crossAxisCount; x++) {
      pieceList.add(
        Uint8List.fromList(
          encodePng(
            copyCrop(
              image,
              x * length,
              y * length,
              length,
              length,
            ),
          ),
        ),
      );
    }
  }
  return Future.value(pieceList);
}

class ImagesRepositoryImpl implements ImagesRepository {
  Map<String, Image> cache = {};

  @override
  Future<List<Uint8List>> split(String asset, int crossAxisCount) async {
    late Image image;
    if (cache.containsKey(asset)) {
      image = cache[asset]!;
    } else {
      final bytes = await rootBundle.load(asset);

      /// use compute because theimage package is a pure dart package
      /// so to avoid bad ui performance we do this task in a different
      /// isolate
      image = await compute(decodeAsset, bytes);

      final width = math.min(image.width, image.height);

      /// convert to square
      image = copyResizeCropSquare(image, width);
      cache[asset] = image;

    }

    final pieces = await compute(
      splitImage,
      SPlitData(image, crossAxisCount),
    );

    return pieces;
  }
}
