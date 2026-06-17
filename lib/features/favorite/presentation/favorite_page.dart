import 'package:flutter/material.dart';
import 'package:hotelino/features/home/logic/providers/home_provider.dart';
import 'package:hotelino/features/home/presentation/widgets/hotel_vertical_list.dart';
import 'package:hotelino/features/home/presentation/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'هتل های مورد علاقه',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            Searchbar(),
            SizedBox(height: 16),
            
            
          ],
        ),
      ),
    );
  }
}
