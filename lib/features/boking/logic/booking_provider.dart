import 'package:flutter/material.dart';
import 'package:hotelino/features/boking/data/models/booking_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider extends ChangeNotifier {
  final BookingModel _bookingModel = BookingModel();

  BookingModel get booking => _bookingModel;

  void setName(String value) {
    _bookingModel.fullName = value;
    notifyListeners();
  }

  void setDestination(String value) {
    _bookingModel.destination = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _bookingModel.phoneNumber = value;
    notifyListeners();
  }

  void setNumberOfGuestes(String value) {
    _bookingModel.numberOfGuests = value;
    notifyListeners();
  }

  void setRangeDate(JalaliRange value) {
    _bookingModel.checkInOutRangeDate = value;
    notifyListeners();
  }
}
