# Tukaatu - Technology Stack

## Core Platform
- **Flutter** SDK (uses-material-design: true)
- **Dart** SDK: ^3.8.0
- **App version**: 1.1.31+31
- **Platforms**: Android (Kotlin), iOS (Swift + CocoaPods)

## State Management
- `flutter_bloc: ^9.1.0` — BLoC and Cubit pattern throughout
- `rxdart: ^0.28.0` — Reactive streams where needed

## Navigation
- `go_router: ^14.8.1` — Declarative routing with typed `state.extra` params
- Custom `GoRoutes` extension on `String` for concise route definitions

## Dependency Injection
- `get_it: ^8.0.3` — Service locator
- `injectable: ^2.5.0` — Code-gen annotations (`@injectable`, `@lazySingleton`, etc.)
- `injectable_generator: ^2.8.1` — Build runner generator

## Networking
- `dio: ^5.4.3+1` — HTTP client
- `pretty_dio_logger: ^1.4.0` — Request/response logging
- `http: ^1.6.0` — Used for specific external calls
- Custom `DioApiClient` wrapping GET, POST, PUT, PATCH, DELETE with auth token injection
- Custom `AppInterceptor` for response validation
- `ApiErrorResponse` / `ApiConnectionRefusedError` for typed error handling

## Code Generation
- `build_runner: ^2.15.1`
- `freezed: ^3.2.3` + `freezed_annotation: ^3.1.0` — Immutable models and states
- `json_serializable: ^6.7.0` + `json_annotation: ^4.12.0` — JSON parsing
- `flutter_gen_runner: ^5.14.1` — Type-safe asset/font references → `lib/gen/`

## Local Storage
- `shared_preferences: ^2.5.3` — Wrapped in `Preferences` class with typed keys

## UI & Theming
- `flutter_screenutil: ^5.9.3` — Responsive sizing
- `google_fonts: ^6.2.1` — Additional fonts
- Custom fonts: **Inter** (200–900) and **Nunito** (200–900) bundled in `assets/fonts/`
- `shimmer: ^3.0.0` — Loading skeleton animations
- `loading_animation_widget: ^1.2.1` — Loaders
- `flutter_animate: ^4.5.0` — Declarative animations
- `auto_size_text: ^3.0.0` — Auto-scaling text
- `carousel_slider: ^5.1.1` — Image/content carousels
- `pinput: ^5.0.0` — OTP pin input
- `persistent_bottom_nav_bar_v2: ^6.3.2` — Bottom navigation

## Images & Media
- `cached_network_image: ^3.4.1` — Network image caching
- `flutter_svg: ^2.0.10+1` — SVG rendering
- `image_picker: ^1.1.2` — Camera/gallery picker
- `image_cropper: ^8.0.2` — Image cropping
- `video_player: ^2.11.1` — Video playback
- `pro_video_editor: ^2.4.0` — Video editing UI
- `pro_image_editor: ^12.4.7` — Image editing UI
- `vector_graphics: any` — Vector graphics support

## Location & Maps
- `geolocator: ^14.0.2` — Device location
- `flutter_map: ^8.3.0` — Map widget
- `latlong2: ^0.9.1` — Lat/lng coordinate types

## Communication & Real-time
- `pusher_channels_flutter: ^2.6.0` — Pusher WebSocket channels for real-time chat/notifications

## Utilities
- `dartz: ^0.10.1` — Functional programming (Either, Option)
- `intl: ^0.20.2` — Internationalization and date formatting
- `intl_phone_field: ^3.2.0` — Phone number input with country code
- `form_validator: ^2.1.1` — Form validation helpers
- `easy_debounce: ^2.0.3` — Debounce for search inputs
- `path_provider: ^2.1.4` — File system paths
- `file_picker: ^10.0.0` — File selection
- `permission_handler: ^11.3.1` — Runtime permissions
- `device_info_plus: ^10.1.2` — Device information
- `share_plus: ^12.0.2` — Native share sheet
- `url_launcher: ^6.3.0` — Open URLs / deep links
- `webview_flutter: ^4.13.1` — In-app web view
- `speech_to_text: ^7.4.0` — Voice search
- `vibration: ^3.1.3` — Haptic feedback
- `visibility_detector: ^0.4.0+2` — Detect widget visibility (video autoplay)
- `fluttertoast: ^8.2.12` — Toast notifications
- `flutter_widget_from_html: ^0.15.2` — Render HTML content
- `infinite_scroll_pagination: ^4.0.0` — Paginated list support
- `flutter_displaymode: ^0.6.0` — High refresh rate display

## Code Quality
- `very_good_analysis: ^6.0.0` — Strict lint rules
- `analysis_options.yaml` — Project lint configuration

## Asset Generation
- `flutter_launcher_icons: ^0.13.1` — App icon generation
- Assets declared in `pubspec.yaml` under `flutter.assets` and `flutter.fonts`
- Generated references in `lib/gen/assets.gen.dart` and `lib/gen/fonts.gen.dart`

## Mason (Code Scaffolding)
- `mason.yaml` + `bricks/bloc/` — Custom brick for generating feature modules with data/presentation layers

## Development Commands
```bash
# Get dependencies
flutter pub get

# Run code generation (freezed, json_serializable, injectable, flutter_gen)
dart run build_runner build --delete-conflicting-outputs

# Run app (staging by default)
flutter run

# Build Android release
flutter build apk --release

# Build iOS release
flutter build ios --release

# Generate app icons
dart run flutter_launcher_icons

# Scaffold a new feature with Mason
mason make bloc --name <feature_name>
```

## Environment Configuration
- Three environments: `development`, `staging`, `production`
- Controlled via `AppConfiguration` enum and `EnvironmentHelper`
- Entry points: `DevelopmentEntryPoint`, `StagingEntryPoint`, `ProductionEntryPoint`
- `main.dart` uses `StagingEntryPoint` by default
