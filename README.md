# 📱 Nombre del Proyecto

Aplicación Flutter desarrollada con **Flutter 3.29**, que utiliza **BLoC** para la gestión de estado y cubre funcionalidades como:

- Perfil de usuario con edición de datos
- Selección de imágenes para foto de perfil
- Efectos de carga con Shimmer
- Peticiones HTTP a una API

## 🚀 Empezando

### Prerrequisitos

- Flutter SDK **3.29.0** o superior
- Android Studio/Xcode (para emuladores)
- Dispositivo físico o emulador

### Instalación

1. Clona el repositorio:

   ```bash
   git clone https://github.com/cheo1894/prueba_tecnica_avila_tek_wilmer_molina.git

   ```

2. Entra al directorio del proyecto:

   cd tu-proyecto

3. Instala las dependencias:

   flutter pub get

4. Ejecuta el simulador:

   flutter run

5. General un APK Release:

   flutter build apk --release

6. El APK se generará en:

   build/app/outputs/flutter-apk/app-release.apk

📦 Dependencias:

    Paquete	Versión	Uso
    gap	^3.0.1	Reemplazo de SizedBox
    http	^1.4.0	Peticiones HTTP
    shimmer	^3.0.0	Efectos de carga
    image_picker	^1.1.2	Selección de imágenes
    flutter_bloc	^9.1.1	Gestión de estado
    equatable	^2.0.7	Comparación de estados

🏗️ Estructura del Proyecto:

    └── lib/
    ├── cubit/
    │   ├── activeButton/
    │   │   ├── active_button_cubit.dart
    │   │   └── active_button_state.dart
    │   ├── jobs/
    │   │   ├── jobs_cubit.dart
    │   │   └── jobs_state.dart
    │   ├── photo/
    │   │   ├── photo_cubit.dart
    │   │   └── photo_state.dart
    │   └── user/
    │       ├── user_cubit.dart
    │       └── user_state.dart
    ├── data/
    │   └── datasource/
    │       └── user_sources.dart
    ├── presentation/
    │   ├── pages/
    │   │   ├── edit_user_info.dart
    │   │   └── user_info.dart
    │   └── widgets/
    │       ├── app_appbar.dart
    │       ├── app_button.dart
    │       ├── app_icon_text_button.dart
    │       ├── app_modal_bottom_sheet.dart
    │       ├── app_progress_indicartor.dart
    │       ├── app_shimmer.dart
    │       ├── bottom_box.dart
    │       ├── info_tile.dart
    │       ├── input_form.dart
    │       └── user_image.dart
    └── main.dart
