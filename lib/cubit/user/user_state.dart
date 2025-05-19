// Importación de la librería Equatable para facilitar comparaciones
import 'package:equatable/equatable.dart';

/// Clase abstracta que representa el estado del usuario
abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Estado que indica el inicio del proceso del usuario
class UserInitial extends UserState {}

/// Estado que indica que se está cargando la información del usuario
class UserLoading extends UserState {}

/// Estado que indica que la información del usuario se ha cargado correctamente
class UserLoaded extends UserState {
  // Datos del usuario en forma de mapa
  final Map<String, dynamic> userData;

  // Constructor que inicializa userData
  UserLoaded(this.userData);

  @override
  List<Object?> get props => [userData];
}

/// Estado que indica que ha ocurrido un error en el manejo del usuario
class UserError extends UserState {
  // Mensaje descriptivo del error
  final String message;

  // Constructor que inicializa el mensaje de error
  UserError(this.message);

  @override
  List<Object?> get props => [message];
}
