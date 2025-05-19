import 'package:equatable/equatable.dart';

class ActiveButtonState extends Equatable {
  final bool active;

  ActiveButtonState({required this.active});

  @override
  // TODO: implement props
  List<Object?> get props => [active];
}
