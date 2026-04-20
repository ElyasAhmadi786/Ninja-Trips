import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trips/models/booking.dart';
import 'package:trips/utils/language_manager.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _language = 'en';
  List<String> _favoriteIds = [];
  List<Booking> _bookings = [];
  bool _notifications = true;
  String _currency = 'USD';

  // User profile
  String _userName = 'Ninja Traveler';
  String _userEmail = 'ninja@trips.com';

  ThemeMode get themeMode => _themeMode;
  String get language => _language;
  List<String> get favoriteIds => List.unmodifiable(_favoriteIds);
  List<Booking> get bookings => List.unmodifiable(_bookings);
  bool get notifications => _notifications;
  String get currency => _currency;
  String get userName => _userName;
  String get userEmail => _userEmail;

  int get tripsCount => _bookings.length;
  int get countriesCount => _bookings.map((b) => b.tripLocation).toSet().length;

  AppProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme_mode') ?? 'light';
    _language = prefs.getString('language') ?? 'en';
    _favoriteIds = prefs.getStringList('favorite_ids') ?? [];
    _notifications = prefs.getBool('notifications') ?? true;
    _currency = prefs.getString('currency') ?? 'USD';
    _userName = prefs.getString('user_name') ?? 'Ninja Traveler';
    _userEmail = prefs.getString('user_email') ?? 'ninja@trips.com';

    // Load bookings
    final bookingsJson = prefs.getStringList('bookings') ?? [];
    _bookings = bookingsJson
        .map((j) => Booking.fromMap(jsonDecode(j) as Map<String, dynamic>))
        .toList();

    LanguageManager.currentLanguage = _language;
    _themeMode = theme == 'dark'
        ? ThemeMode.dark
        : theme == 'system'
            ? ThemeMode.system
            : ThemeMode.light;

    notifyListeners();
  }

  Future<void> _saveBookings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'bookings',
      _bookings.map((b) => jsonEncode(b.toMap())).toList(),
    );
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'theme_mode',
      mode == ThemeMode.dark
          ? 'dark'
          : mode == ThemeMode.system
              ? 'system'
              : 'light',
    );
    notifyListeners();
  }

  Future<void> changeLanguage(String lang) async {
    _language = lang;
    LanguageManager.changeLanguage(lang);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    notifyListeners();
  }

  // --- Favorites ---
  bool isFavorite(String tripId) => _favoriteIds.contains(tripId);

  Future<void> toggleFavorite(String tripId) async {
    if (_favoriteIds.contains(tripId)) {
      _favoriteIds.remove(tripId);
    } else {
      _favoriteIds.add(tripId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_ids', _favoriteIds);
    notifyListeners();
  }

  // --- Bookings ---
  Future<void> addBooking(Booking booking) async {
    _bookings.insert(0, booking);
    await _saveBookings();
    notifyListeners();
  }

  Future<void> cancelBooking(String bookingId) async {
    final idx = _bookings.indexWhere((b) => b.id == bookingId);
    if (idx != -1) {
      final old = _bookings[idx];
      _bookings[idx] = Booking(
        id: old.id,
        tripId: old.tripId,
        tripTitle: old.tripTitle,
        tripImg: old.tripImg,
        tripLocation: old.tripLocation,
        travelerName: old.travelerName,
        travelerEmail: old.travelerEmail,
        travelers: old.travelers,
        bookingDate: old.bookingDate,
        travelDate: old.travelDate,
        totalPrice: old.totalPrice,
        status: 'cancelled',
      );
      await _saveBookings();
      notifyListeners();
    }
  }

  // --- Notifications ---
  Future<void> setNotifications(bool value) async {
    _notifications = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', value);
    notifyListeners();
  }

  // --- Currency ---
  Future<void> setCurrency(String currency) async {
    _currency = currency;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currency', currency);
    notifyListeners();
  }

  // --- User Profile ---
  Future<void> updateProfile({required String name, required String email}) async {
    _userName = name;
    _userEmail = email;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setString('user_email', email);
    notifyListeners();
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isSystemTheme => _themeMode == ThemeMode.system;
}