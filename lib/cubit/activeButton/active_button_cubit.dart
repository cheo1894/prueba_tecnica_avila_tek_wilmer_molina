import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_avila_tek/cubit/activeButton/active_button_state.dart';

class ActiveButtonCubit extends Cubit<ActiveButtonState> {
  ActiveButtonCubit() : super(ActiveButtonState(active: false));

  updateActiveButton(bool value) {
    emit(ActiveButtonState(active: value));
  }
}
