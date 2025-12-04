import 'package:flutter/material.dart';
import 'package:trips/utils/language_manager.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
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