import 'package:Hotelino/features/home/data/models/profile.dart';

class ProfileRepository {
  Future<Profile> fetchUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 100));

    return Profile(
      id: "7954862145",
      name: "علیرضا جاهدی",
      email: "alirezaJahed30@gmail.com",
      avatarUrl: "https://dunijet.ir/content/projects/hotelino/profile_pic.png",
      phoneNumber: "+989123456789",
      location: "شیراز، ایران",
      bio: "عاشق سفر و تجربه هتل‌های لاکچری 🌍✨",
      bookings: 12,
      favorites: 5,
      notifications: 3,
    );
  }
}
