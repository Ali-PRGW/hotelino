import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/data/models/profile_data.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/features/home/data/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepository _hotelRepository;
  
  List<Hotel> _hotels = [];
  ProfileData? _profileData;
  ProfileData? get profileData => _profileData;

  ProfileProvider(this._profileRepository, this._hotelRepository) {
    loadUserProfile();
    fetchHotels();
  }

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
  }

  loadUserProfile() async {
    _profileData = await _profileRepository.fetchUserProfile();
    notifyListeners();
  }








  //Recently hotel viewed -------------------------------------------------------

  final List<String> _recentlyViewdHotels = [];

  List<Hotel> get recentlyViewedHotels => 
  _hotels.where((hotel) => _recentlyViewdHotels.contains(hotel.id),).toList();


  void addRecentlyViewedHotels(String hotelId){

    if(!recentlyViewedHotels.contains(hotelId)){
      _recentlyViewdHotels.add(hotelId);
      notifyListeners();
    }else{
      _recentlyViewdHotels.remove(hotelId);
      _recentlyViewdHotels.add(hotelId);
      notifyListeners();
    }

  }


}
