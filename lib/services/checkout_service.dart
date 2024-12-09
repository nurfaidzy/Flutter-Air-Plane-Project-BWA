import 'package:air_plane/models/checkout_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutService {
  final CollectionReference _checkoutReference =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> setCheckout(CheckoutModel checkout) async {
    try {
      String documentId =
          checkout.id.isEmpty ? _checkoutReference.doc().id : checkout.id;

      await _checkoutReference.doc(documentId).set({
        'idDestination': checkout.idDestination,
        'totalTraveler': checkout.totalTraveler,
        'selectedSeats': checkout.selectedSeats,
        'insurance': checkout.insurance,
        'refundable': checkout.refundable,
        'vat': checkout.vat,
        'price': checkout.price,
        'grandTotal': checkout.grandTotal,
      });
    } catch (e) {
      throw Exception("Failed to set checkout. Please try again later.");
    }
  }

  Future<CheckoutModel> getCheckout(String id) async {
    try {
      DocumentSnapshot snapshot = await _checkoutReference.doc(id).get();
      if (!snapshot.exists) {
        throw Exception("No checkout found with ID: $id");
      }
      return CheckoutModel(
        id: id,
        idDestination: snapshot['idDestination'],
        totalTraveler: snapshot['totalTraveler'],
        selectedSeats: List<String>.from(snapshot['selectedSeats']),
        insurance: snapshot['insurance'],
        refundable: snapshot['refundable'],
        vat: snapshot['vat'],
        price: snapshot['price'],
        grandTotal: snapshot['grandTotal'],
      );
    } catch (e) {
      throw Exception("Failed to retrieve checkout. Please try again later.");
    }
  }
}
