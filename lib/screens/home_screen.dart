import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips/screens/search_screen.dart';
import 'package:trips/screens/favorites_screen.dart';
import 'package:trips/screens/profile_screen.dart';
import 'package:trips/widgets/trip_card.dart';
import 'package:trips/utils/trip_data.dart';
import 'package:trips/utils/language_manager.dart';
import 'package:trips/providers/app_provider.dart';

import '../models/trip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const SearchScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: LanguageManager.translate('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: LanguageManager.translate('search'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: LanguageManager.translate('favorites'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: LanguageManager.translate('profile'),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String _selectedCategory = 'All';
  List<Trip> _filteredTrips = [];

  @override
  void initState() {
    super.initState();
    _filteredTrips = tripList;
  }

  void _filterTrips(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredTrips = tripList;
      } else {
        _filteredTrips = tripList
            .where((trip) => trip.category.toLowerCase() == category.toLowerCase())
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final popularTrips = tripList.where((trip) => trip.isPopular).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageManager.translate('appTitle'),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0), // کاهش padding کلی
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Card (ساده‌تر)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageManager.translate('welcomeTitle'),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LanguageManager.translate('welcomeSubtitle'),
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Categories
              Text(
                LanguageManager.translate('categories'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 36, // ارتفاع کمتر برای دکمه‌ها
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ['All', 'Beach', 'Mountain', 'City', 'Desert', 'Island']
                      .map((category) {
                    String translatedCategory = category;
                    switch (category) {
                      case 'All':
                        translatedCategory = LanguageManager.translate('all');
                        break;
                      case 'Beach':
                        translatedCategory = LanguageManager.translate('beach');
                        break;
                      case 'Mountain':
                        translatedCategory = LanguageManager.translate('mountain');
                        break;
                      case 'City':
                        translatedCategory = LanguageManager.translate('city');
                        break;
                      case 'Desert':
                        translatedCategory = LanguageManager.translate('desert');
                        break;
                      case 'Island':
                        translatedCategory = LanguageManager.translate('island');
                        break;
                    }

                    return GestureDetector(
                      onTap: () => _filterTrips(category),
                      child: Container(
                        margin: const EdgeInsets.only(right: 6), // کاهش فاصله
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedCategory == category
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedCategory == category
                                ? Theme.of(context).primaryColor
                                : Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          translatedCategory,
                          style: TextStyle(
                            fontSize: 13,
                            color: _selectedCategory == category
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyMedium?.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Popular Trips - فقط اگر وجود داشته باشد
              if (popularTrips.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageManager.translate('popularTrips'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all popular trips
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        LanguageManager.translate('seeAll'),
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 215, // ارتفاع کمتر برای لیست افقی
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularTrips.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140, // عرض کمتر برای کارت‌ها
                        margin: EdgeInsets.only(
                          right: index == popularTrips.length - 1 ? 0 : 8,
                        ),
                        child: TripCard(trip: popularTrips[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // All Trips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedCategory == 'All'
                        ? LanguageManager.translate('allTrips')
                        : '${LanguageManager.translate(_selectedCategory.toLowerCase())} Trips',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (_selectedCategory != 'All')
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${_filteredTrips.length}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              if (_filteredTrips.isEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 60,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No trips found',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Try another category',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8, // کاهش فاصله بین ستون‌ها
                    mainAxisSpacing: 8, // کاهش فاصله بین ردیف‌ها
                    childAspectRatio: 0.7, // نسبت جدید برای کارت‌های جمع‌وجورتر
                  ),
                  itemCount: _filteredTrips.length,
                  itemBuilder: (context, index) {
                    return TripCard(trip: _filteredTrips[index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}