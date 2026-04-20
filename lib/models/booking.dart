class Booking {
  final String id;
  final String tripId;
  final String tripTitle;
  final String tripImg;
  final String tripLocation;
  final String travelerName;
  final String travelerEmail;
  final int travelers;
  final DateTime bookingDate;
  final DateTime travelDate;
  final double totalPrice;
  final String status; // 'confirmed', 'pending', 'cancelled'

  Booking({
    required this.id,
    required this.tripId,
    required this.tripTitle,
    required this.tripImg,
    required this.tripLocation,
    required this.travelerName,
    required this.travelerEmail,
    required this.travelers,
    required this.bookingDate,
    required this.travelDate,
    required this.totalPrice,
    this.status = 'confirmed',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tripId': tripId,
      'tripTitle': tripTitle,
      'tripImg': tripImg,
      'tripLocation': tripLocation,
      'travelerName': travelerName,
      'travelerEmail': travelerEmail,
      'travelers': travelers,
      'bookingDate': bookingDate.toIso8601String(),
      'travelDate': travelDate.toIso8601String(),
      'totalPrice': totalPrice,
      'status': status,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      tripId: map['tripId'],
      tripTitle: map['tripTitle'],
      tripImg: map['tripImg'],
      tripLocation: map['tripLocation'],
      travelerName: map['travelerName'],
      travelerEmail: map['travelerEmail'],
      travelers: map['travelers'],
      bookingDate: DateTime.parse(map['bookingDate']),
      travelDate: DateTime.parse(map['travelDate']),
      totalPrice: (map['totalPrice'] as num).toDouble(),
      status: map['status'] ?? 'confirmed',
    );
  }
}
