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

## Configuration ⚙️

### Routes

The app uses named routes defined in `lib/routes/appRoutes.dart`:

```dart
'/hotel-detail': (context) => HotelDetailPage(
  hotelId: ModalRoute.of(context)!.settings.arguments as String,
),
```

### Theme

Toggle between light and dark themes using the `ThemeProvider`:

```dart
Provider.of<ThemeProvider>(context).toggleBrightness();
```

## Key Features Implementation 🔑

### Hotel Card Navigation

```dart
GestureDetector(
  onTap: () {
    Navigator.pushNamed(context, '/hotel-detail', arguments: hotel.id);
  },
  child: HotelCard(hotel: hotel),
)
```

### Favorite Management

```dart
final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
favoriteProvider.toggleFavorite(hotelId);
```

### Image Caching

Uses `AssetImage` for efficient caching of local images. For network images, consider adding `cached_network_image` package.

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

## Contributing 🤝

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Contact 📧

Alireza Jahedi 

Project Link: [https://github.com/Alirezajhd/hotelino](https://github.com/Alirezajhd/hotelino)

## Acknowledgments 🙏

- Flutter team for the amazing framework
- All contributors who helped with this project
- Design inspiration from modern hotel booking apps

---

Made with ❤️ using Flutter
