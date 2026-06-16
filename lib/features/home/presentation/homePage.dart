import 'package:flutter/material.dart';
import 'package:hotelino/features/home/logic/providers/home_provider.dart';
import 'package:hotelino/features/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/features/home/presentation/widgets/searchbar.dart';
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
            Searchbar()],
        ),
      ),
    );
  }
}
