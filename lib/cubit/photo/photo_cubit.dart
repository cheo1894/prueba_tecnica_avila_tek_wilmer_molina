import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_avila_tek/cubit/photo/photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoState(photoPath: ''));

  void updatephoto(String path) {
    emit(PhotoState(photoPath: path));
  }
}
