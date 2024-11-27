import 'package:equatable/equatable.dart';

class PlacesModel extends Equatable {
  final int id;
  final String name;
  final String city;
  final String image;
  final double rating;
  final int price;

  const PlacesModel({
    required this.id,
    required this.name,
    required this.city,
    required this.image,
    required this.rating,
    required this.price,
  });

  // Add: Factory constructor to create an instance from JSON
  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      image: json['image'],
      rating:
          (json['rating'] as num).toDouble(), // Convert to double if necessary
      price: json['price'],
    );
  }

  @override
  List<Object?> get props => [id, name, city, image, rating, price];
}
