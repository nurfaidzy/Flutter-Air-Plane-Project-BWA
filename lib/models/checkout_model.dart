import 'package:equatable/equatable.dart';

class CheckoutModel extends Equatable {
  final String id;
  final int idDestination;
  final int totalTraveler;
  final List<String> selectedSeats;
  final bool insurance;
  final bool refundable;
  final int vat;
  final int price;
  final int grandTotal;

  CheckoutModel({
    required this.id,
    required this.idDestination,
    required this.totalTraveler,
    required this.selectedSeats,
    required this.insurance,
    required this.refundable,
    required this.vat,
    required this.price,
    required this.grandTotal,
  });

  @override
  List<Object?> get props => [
        id,
        idDestination,
        totalTraveler,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
      ];
}
