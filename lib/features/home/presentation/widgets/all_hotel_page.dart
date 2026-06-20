import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_vertical_list.dart';

class AllHotelsPage extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;

  const AllHotelsPage({
    super.key,
    required this.title,
    required this.hotels,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: HotelVerticalList(
          title: title,
          hotels: hotels,
        ),
      ),
    );
  }
}
