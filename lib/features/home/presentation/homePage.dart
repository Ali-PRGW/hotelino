import 'package:flutter/material.dart';
import 'package:hotelino/features/home/logic/providers/home_provider.dart';
import 'package:hotelino/features/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_vertical_list.dart';
import 'package:hotelino/features/home/presentation/widgets/searchbar.dart';
import 'package:hotelino/features/home/presentation/widgets/story_carousel.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            Searchbar(),
            SizedBox(height: 16),
            AdBanner(),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  title: "محبوب ترین هتل ها",
                  hotels: homeProvider.getPopularHotels(),
                  onSeeAllPressed: () {},
                );
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  title: "پیشنهاد ویژه روز",
                  hotels: homeProvider.getSpecialOffersHotels(),
                  onSeeAllPressed: () {},
                );
              },
            ),

            SizedBox(height: 16),

            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.getStoryIamge(),
                  titles: homeProvider.storyTitles,
                );
              },
            ),
            
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelVerticalList(
                  title: "جدید ترین هتل ها",
                  hotels: homeProvider.getNewestHotels(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
