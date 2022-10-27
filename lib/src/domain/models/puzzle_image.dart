import 'package:equatable/equatable.dart';

class PuzzleImage extends Equatable {
  final String name;
   String assetPath;
  final String soundPath;

   PuzzleImage({
    required this.name,
    required this.assetPath,
    required this.soundPath,
  });

  @override
  List<Object?> get props => [
        name,
        assetPath,
        soundPath,
      ];
}
