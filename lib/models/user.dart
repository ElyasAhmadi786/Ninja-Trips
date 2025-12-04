class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final int tripsCompleted;
  final List<String> favoriteTripIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    this.tripsCompleted = 0,
    this.favoriteTripIds = const [],
  });
}