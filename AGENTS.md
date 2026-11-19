
# STRICT FLUTTER DEVELOPMENT RULES

These rules are mandatory. Always follow them when creating, modifying, or refactoring code.

## 1. Widget Folder Structure
- ALWAYS place reusable UI components inside the existing `widgets/` folder.
- Do not create separate component folders unless explicitly requested.
- Feature-specific reusable widgets must stay inside their respective feature's `presentation/screens/widget` folder.
- Shared widgets must stay inside the project's existing common or core widgets folder.
- Do not put reusable widget classes directly inside screen/page 
files.
- use my own app validator
## 2. Never Use Private Classes or Functions
- NEVER create private classes.
- NEVER create private functions or methods.
- NEVER prefix class, function, or method names with `_`.
- All newly created classes, functions, methods, and reusable components must be public.
- Follow this rule even for helper methods and utility classes.

## 3. Freezed Models (MANDATORY)
- ALWAYS use Freezed when creating new data models.
- Do not create ordinary mutable Dart model classes.
- Use Freezed for API request models, response models, entities, and state classes where appropriate.
- Use JsonSerializable for JSON serialization.
- Handle nullable fields and default values properly.
- Follow the existing JSON key naming conventions.
- Never manually modify generated `.freezed.dart` or `.g.dart` files.
- Always generate code using:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 4. Custom Colors and Design System
- always use horizontal spacing and vertical spacing instead of sizedbox(height:30)orsizedbox(width:30)
- ALWAYS use the project's existing `AppColors` class.
- NEVER introduce hardcoded colors when an existing custom color is available.
- Do not use Colors.black, Colors.white, Colors.grey, or Colors.blue directly for UI styling when equivalent AppColors values exist.
- Follow the existing color naming conventions.
- Never introduce a new color unnecessarily.
- Maintain consistent colors throughout the application.

## 5. Common Custom UI Components (MANDATORY)
- ALWAYS reuse existing common custom widgets.
- Before creating a new widget, inspect the existing common widgets folder.
- Use existing custom components such as:
  - AppContainer
  - AppInkWell
  - AppButton
  - AppTextField
  - AppAnimationLottie
  - AppSliverGrid
  - Existing custom spacing widgets
- Use existing AppTextStyles for typography.
- Do not replace existing custom widgets with standard Flutter widgets unnecessarily.
- If a required component does not exist, create a reusable component inside the appropriate `widgets/` folder.
- Do not duplicate existing components.

## 6. Existing Project Architecture
- Strictly follow the existing Feature-First Clean Architecture.
- Maintain the existing data, domain, and presentation separation.
- Do not restructure existing directories without explicit permission.
- Follow existing GetX, BLoC/Cubit, and GoRouter implementation patterns.
- Do not introduce new architecture patterns unnecessarily.

## 7. Existing Code Protection
- NEVER remove existing classes, methods, or functionality without permission.
- NEVER rename existing classes, functions, or variables without permission.
- NEVER change existing method signatures unnecessarily.
- Do not modify unrelated files.
- Preserve existing business logic.
- Make the smallest possible changes to accomplish the requested task.

## 8. UI Development
- Build clean, minimal, professional, responsive interfaces.
- Always use existing custom components, spacing, colors, and typography.
- Avoid unnecessary animations and decorations.
- Avoid duplicated UI code.
- Keep widgets reusable and maintainable.

## 9. Package Management
- Prefer packages already installed in the project.
- NEVER add a new dependency without asking for permission.
- Never replace an existing package without a clear technical reason and approval.

## 10. Mandatory Workflow Before Coding
1. Inspect the existing project structure.
2. Inspect relevant existing widgets and custom components.
3. Inspect existing models and state management.
4. Understand the current implementation.
5. Follow all rules in this AGENTS.md.
6. Implement only the requested changes.
7. Check imports and formatting.
8. Run Flutter analyze when possible.

## 11. Final Response Rules
- When asked for a complete file, ALWAYS provide the complete file.
- When asked for a specific modification, avoid rewriting unrelated code.
- Include all required imports.
- Never provide incomplete placeholder implementations.
- Clearly mention modified files.
- Mention any unverified assumptions or testing limitations.

IMPORTANT:
If any implementation conflicts with these rules, these rules take priority unless I explicitly instruct otherwise.
