import 'package:equatable/equatable.dart';

class PhotoState extends Equatable {
  final String photoPath;

  const PhotoState({required this.photoPath});

  @override
  List<Object?> get props => [photoPath];
}
