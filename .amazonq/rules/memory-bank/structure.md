# Tukaatu - Project Structure

## Top-Level Layout
```
Tukaatu/
├── lib/                  # All Dart source code
├── assets/               # Images (PNG/SVG) and fonts (Inter, Nunito)
├── android/              # Android native project (Kotlin)
├── ios/                  # iOS native project (Swift + CocoaPods)
├── bricks/               # Mason code generation templates
├── .amazonq/rules/       # Amazon Q memory bank and rules
├── pubspec.yaml          # Dependencies and asset declarations
└── analysis_options.yaml # Lint rules (very_good_analysis)
```

## lib/ Directory Structure
```
lib/
├── main.dart                        # Entry point → StagingEntryPoint
├── constants/                       # App-wide constants
│   ├── app_colors.dart              # Color palette (AppColors)
│   ├── app_constant.dart            # Misc constants
│   ├── app_endpoints.dart           # API endpoint strings
│   ├── app_images.dart              # Image path constants
│   └── app_lottie_animation.dart    # Lottie asset paths
├── core/                            # Infrastructure / cross-cutting concerns
│   ├── bloc_provider/               # Global BlocProvider list
│   ├── build_variants/              # Environment entry points & enum
│   ├── config/                      # AppConfig, EnvironmentHelper
│   ├── dio_provider/                # DioApiClient, ApiError, ApiResponse
│   ├── preferences/                 # SharedPreferences wrapper
│   ├── routes/                      # GoRouter configuration (AppRoutes)
│   ├── theme/                       # AppTheme
│   └── usecase/                     # Base UseCase abstraction
├── enum/                            # App-level enums (TheStates, badges, etc.)
├── extensions/                      # Dart extensions (String, Date)
├── features/                        # Feature modules (see below)
├── gen/                             # flutter_gen output (assets.gen.dart, fonts.gen.dart)
├── Injectable/                      # get_it + injectable setup
├── services/                        # Auth guard, voice search service
└── utils/                           # Helpers: navigator, text styles, validators, etc.
```

## Feature Module Structure
Each feature follows a consistent layered structure:
```
features/<feature_name>/
├── data/
│   ├── model/       # JSON-serializable models (json_serializable / freezed)
│   └── source/      # Remote data sources (calls DioApiClient)
└── presentation/
    ├── bloc/ or cubit/   # State management (Cubit or Bloc)
    └── screens/          # UI screens and widgets
```

## Feature List
| Feature | Description |
|---|---|
| app | App entry point, initializer, MyApp root widget |
| home | Home feed with product/content cards |
| home_feed_video | Video items in home feed |
| reels | Short-form video reels |
| films_creation | Video/film upload and editing |
| user_films_section | User's own films |
| product_profile | Product detail view |
| product_bid_list | Bids on a product |
| bid_details | Single bid detail |
| bid_request_list | Incoming bid requests |
| cart | Shopping cart |
| buy | Checkout / purchase flow |
| orders | Order list and details |
| hamro_pay | HamroPay payment gateway |
| store_profile | Store/seller profile |
| profile | User profile |
| edit_profile | Edit user profile |
| login | Phone/OTP login |
| sign_up | Registration |
| otp_verify | OTP verification |
| reset_password | Password reset |
| change_password_new | Change password |
| search | Search results |
| search_engine | Advanced search |
| notifications | Push notifications |
| chat | Messaging |
| mark | Saved/bookmarked items |
| map | Map view |
| add_address | Add delivery address |
| dafault_address_list | Default address management |
| content_score | Content scoring |
| dynamic_page | CMS-driven pages |
| help_and_support | Help/FAQ |
| video_editor | Video editing |
| splash | Splash screen |
| main | Bottom nav shell screen |
| common | Shared UI widgets (50+ reusable components) |

## Common Widgets (lib/features/common/)
A large library of prefixed reusable widgets:
- `AppScaffold`, `AppAppBar` / `CustomAppBar`
- `AppListView`, `AppGridViewList` — paginated lists
- `AppCachedImage`, `AppCircularImage` — image display
- `AppShimmer`, `AppShimmerContainer` — loading skeletons
- `AppElevatedButton`, `AppFilledButton`, `AppOutlinedButton`, `AppTextButton`
- `AppTextFormField`, `AppTextFieldWithoutLabel`
- `AppErrorWidget`, `AppLoadingWidget`, `AppCircularLoader`
- `AppBottomSheet`, `AppAlertDialog`
- `AppSpacing` / `VerticalSpacing` / `HorizontalSpacing`
- `AppStateWrapper` — wraps BlocBuilder with state handling

## Architectural Patterns
- **Feature-first** folder organization
- **BLoC / Cubit** for all state management (flutter_bloc)
- **GoRouter** for declarative navigation with typed extras
- **get_it + injectable** for dependency injection
- **Dio** for HTTP with custom interceptors and error handling
- **Freezed** for immutable state/model classes
- **json_serializable** for JSON parsing
- **flutter_gen** for type-safe asset references
- **Mason bricks** for scaffolding new feature modules
