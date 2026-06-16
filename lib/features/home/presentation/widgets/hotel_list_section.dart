import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/logic/providers/favorite_item_provider.dart';
import 'package:provider/provider.dart';

class HotelListSection extends StatelessWidget {
  const HotelListSection({
    super.key,
    required this.title,
    required this.hotels,
    this.onSeeAllPressed,
  });

  final String title;
  final List<Hotel> hotels;
  final VoidCallback? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "مشاهده همه",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(title , style: Theme.of(context).textTheme.displayMedium,)
            ],
          ),
        ),
        SizedBox(height: 360,child: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return Consumer<FavoriteItemProvider>(

             );
          },
        ),
      )

      ],
    );
  }
}
