# Luna — AI Parenting Companion

A Flutter project for Luna, the AI-powered parenting companion app. Built with Material 3 and Google Fonts, ready for FlutterFlow import.

## Project Structure

```
luna-flutter/
├── pubspec.yaml
├── README.md
└── lib/
    ├── main.dart              # App entry point, routing, device frame
    ├── theme.dart             # Brand colors, typography, M3 theme
    ├── models/
    │   └── message.dart       # Chat message model + sample data
    ├── screens/
    │   ├── splash_screen.dart      # Animated splash
    │   ├── onboarding_screen.dart  # 3-slide PageView onboarding
    │   ├── chat_screen.dart        # Main landing — chat with Luna
    │   ├── diary_screen.dart       # Parenting diary entries
    │   ├── growth_screen.dart      # Milestone & growth tracking
    │   ├── nutrition_screen.dart   # Meal tracking & nutrient info
    │   └── profile_screen.dart     # User profile + framework chips
    └── widgets/
        ├── message_bubble.dart     # Chat message bubble
        ├── mode_chip.dart          # 6 mode chips (Crisis, etc.)
        ├── input_bar.dart          # Chat input bar (mic/cam/text/save)
        ├── framework_chip.dart     # 10 parenting framework chips
        └── luna_bottom_nav.dart    # Custom 5-tab bottom nav
```

## Screen Flow

```
Splash → Onboarding (3 slides) → Chat (main landing)
                                       ↕
                                  Diary | Growth | Nutrition | Profile
```

## Brand Colors

| Color | Hex | Usage |
|---|---|---|
| Dark Purple | `#2B2447` | Primary, text |
| Medium Purple | `#6B5FA6` | Primary variant, accents |
| Light Purple | `#B9A7D9` | Secondary, borders |
| Gold | `#D8B67A` | Accent, highlights |
| Cream | `#F7EAD6` | Surface, backgrounds |

## Typography

- **Headings**: DM Serif Display (via Google Fonts)
- **Body**: Inter (via Google Fonts)

## Screens (7 total)

### 1. Splash Screen
Animated logo, app name "Luna", tagline "AI Parenting Companion", auto-navigates after 3s.

### 2. Onboarding Screen
3 slides in a PageView with animated page indicator, Skip button, Continue/Get Started button.

### 3. Chat Screen (Main Landing)
- Message bubbles (user + Luna with avatar)
- 6 mode chips: Crisis, Reflection, Milestone, Bonding, Wellness, Observation
- Input bar with mic, camera, text field, send buttons
- "Save to: Diary →" indicator that appears after mode selection
- Sample conversation pre-loaded

### 4. Diary Screen
- Weekly summary card + streak counter
- Diary entry cards with date, mood, mode tag, preview
- FloatingActionButton for new entry

### 5. Growth Screen
- Growth stats card (weight, height, head circumference + percentiles)
- Milestone timeline (achieved + upcoming)
- Simple growth chart visualization

### 6. Nutrition Screen
- Today's nutrient intake circles (calories, protein, iron, calcium)
- Meal log with time and food items
- Nutrient spotlight tips
- Allergen introduction tracker

### 7. Profile Screen
- User avatar + stats (entries, streak, moods)
- Baby profile section (name, DOB, gender, blood type, pediatrician)
- 10 Parenting Framework chips: Montessori, RIE, Positive Discipline, Gentle Parenting, Attachment, Authoritative, Conscious, Waldorf, Emotion Coaching, Pikler
- App settings (notifications, dark mode, privacy, help, about)

## Bottom Navigation

| Tab | Icon | Note |
|---|---|---|
| Diary | 📖 | |
| Growth | 📈 | |
| **Luna✦** | ✨ | Center, elevated with gradient + shadow |
| Nutrition | 🍽️ | |
| Profile | 👤 | |

## Viewport

All screens render at **390×844px** (iPhone 14 dimensions). On larger displays, content centers inside a device frame.

## How to Import into FlutterFlow

### Method 1: Zip Upload (Recommended)

1. **Create a zip** of the `luna-flutter/` directory
2. In FlutterFlow, go to your project → **Settings & Integrations** → **Project Setup**
3. Click **Upload Code** or **Import Custom Code**
4. Upload the zip file
5. FlutterFlow will extract the source files into `lib/custom_code/`
6. Reference widgets using: `import 'custom_code/luna_flutter/widgets/...'`

### Method 2: Manual File Import

1. In FlutterFlow, navigate to the **Custom Code** tab (left sidebar)
2. Click **+ Add** → **Custom Widget**
3. Paste each widget's code individually
4. Add dependencies in FlutterFlow's dependency manager:
   - `google_fonts: ^6.1.0`

### Method 3: Local Development → Publish

1. Run `flutter pub get` in the project directory
2. Run `flutter run` to test locally
3. Once satisfied, connect FlutterFlow to a GitHub repo
4. Push the code to the repo
5. FlutterFlow can import from the repo

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
```

## Custom Widgets Available for FlutterFlow

These widgets are designed to be drop-in components in FlutterFlow's Custom Widget system:

| Widget | File | Use Case |
|---|---|---|
| `MessageBubble` | `widgets/message_bubble.dart` | Chat message display |
| `ModeChip` / `ModeChipRow` | `widgets/mode_chip.dart` | Mode selector chips |
| `LunaInputBar` | `widgets/input_bar.dart` | Chat input with actions |
| `FrameworkChip` / `FrameworkChipGrid` | `widgets/framework_chip.dart` | Parenting framework selector |
| `LunaBottomNav` | `widgets/luna_bottom_nav.dart` | Custom bottom navigation |

## Notes

- All widgets are self-contained in the source files — no external assets required
- Uses standard Flutter packages only (google_fonts is the only extra dependency)
- Material 3 enabled throughout
- Fully compatible with Flutter 3.13+
