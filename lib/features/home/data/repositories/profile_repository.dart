import 'package:hotelino/features/home/data/models/profile_data.dart';

class ProfileRepository {

  Future<ProfileData> fetchUserProfile() async {
    
    //if the information comes from a server we can use a delay to ensure data fetches
    await Future.delayed(const Duration(milliseconds: 100));

    return ProfileData(
      id: "1",
      name: "علی رمضانی",
      email: "ali1381ramezaniali@gmail.com",
      avatarUrl: "assets/images/profile.jpg",
      phoneNumber: "09140991784",
      location: "رفسنجان",
      bio: "عاشق سفر و تجربه بهترین هتل ها",
      bookings: 3,
      favorites: 6,
      notifications: 2,
    );
  }
}
