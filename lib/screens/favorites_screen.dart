import 'package:flutter/material.dart';
import 'package:trips/utils/trip_data.dart';
import 'package:trips/screens/details_screen.dart';
import 'package:trips/utils/language_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteTrips = [tripList[0], tripList[2], tripList[3]];

    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageManager.translate('myFavorites')),
      ),
      body: favoriteTrips.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(height: 20),
            Text(
              LanguageManager.translate('noFavorites'),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(LanguageManager.translate('exploreTrips')),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          final trip = favoriteTrips[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/${trip.img}',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image),
                    );
                  },
                ),
              ),
              title: Text(trip.title),
              subtitle: Text(trip.location),
              trailing: const Icon(Icons.favorite, color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(trip: trip),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}