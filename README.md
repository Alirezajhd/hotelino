# Hotelino 🏨

A modern Flutter hotel booking application with a beautiful UI, featuring hotel browsing, favorites, booking management, and user profiles.

## Features ✨

- 🏠 **Home Page** - Browse featured hotels with horizontal and vertical card layouts
- ⭐ **Favorites** - Save and manage your favorite hotels
- 📅 **Booking System** - Complete booking flow with date/time pickers and guest management
- 👤 **User Profile** - Manage user information and app settings
- 🌓 **Theme Toggle** - Switch between light and dark modes
- 📍 **Hotel Details** - View detailed hotel information with interactive maps
- 🔔 **Notifications** - Real-time notification system
- 🎨 **Beautiful UI** - Modern, responsive design with Persian (RTL) support

## Tech Stack 🛠️

- **Flutter** - Cross-platform mobile framework
- **Provider** - State management
- **Flutter Map** - Interactive maps integration
- **Image Picker** - Profile image selection
- **Custom Widgets** - Reusable components (glassmorphism effects, animated buttons, etc.)

## Project Structure 📁

```
lib/
├── core/                    # Core utilities and theme
│   ├── constants/
│   ├── theme/
│   └── utils/
├── features/                # Feature modules
│   ├── booking/
│   ├── favorite/
│   ├── home/
│   ├── hotel_detail/
│   ├── onboarding/
│   └── profile/
├── routes/                  # Navigation and routing
└── shared/                  # Shared services and widgets
```

## Getting Started 🚀

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/hotelino.git
   cd hotelino
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Dependencies 📦

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  flutter_map: ^6.0.0
  latlong2: ^0.9.0
  image_picker: ^1.0.0
```

## Development 💻

### Code Style

This project follows Flutter's official style guide and uses the following linter rules:

```yaml
linter:
  rules:
    prefer_const_constructors: true
    prefer_const_declarations: true
    prefer_const_literals_to_create_immutables: true
```

### State Management

The app uses **Provider** for state management with the following providers:

- `ThemeProvider` - Theme and brightness management
- `ProfileProvider` - User profile data
- `FavoriteItemProvider` - Favorite hotels management
- `HomeProvider` - Home page data
- `OnboardingProvider` - Onboarding flow
- `BookingProvider` - Booking form state

## Contact 📧

Alireza Jahedi

Project Link: [https://github.com/Alirezajhd/hotelino](https://github.com/Alirezajhd/hotelino)

## Acknowledgments 🙏

- **[Dunijet](https://dunijet.ir)** - Special thanks for the excellent Flutter tutorial and guidance in creating this project
- Design inspiration from modern hotel booking apps

---

Made with ❤️ using Flutter

