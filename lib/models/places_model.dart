import 'package:equatable/equatable.dart';

class PlacesModel extends Equatable {
  final int id;
  final String name;
  final String city;
  final String image;
  final double rating;
  final int price;
  final String about;
  final List<String> photos;
  final List<String> interest;

  const PlacesModel({
    required this.id,
    required this.name,
    required this.city,
    required this.image,
    required this.rating,
    required this.price,
    this.about = '',
    this.photos = const [
      'assets/icon_plane.png',
      'assets/icon_plane.png',
      'assets/icon_plane.png',
    ],
    this.interest = const [
      'Kids Park',
      'City Museum',
      'Central Mall',
    ],
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
  // for Detail
  factory PlacesModel.fromJsonDetail(Map<String, dynamic> json) {
    return PlacesModel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      image: json['image'],
      rating:
          (json['rating'] as num).toDouble(), // Convert to double if necessary
      price: json['price'],
      about: json['about'],
      photos: json['photos'].cast<String>(),
      interest: json['interest'].cast<String>(),
    );
  }

  @override
  List<Object?> get props => [id, name, city, image, rating, price];
}
