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
        'userId': checkout.userId,
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

  Future<List<CheckoutModel>> getCheckoutsByUserId(String userId) async {
    try {
      QuerySnapshot querySnapshot =
          await _checkoutReference.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isEmpty) {
        // No documents found for the given userId
        return [];
      }

      // Convert each document to a CheckoutModel
      return querySnapshot.docs.map((doc) {
        return CheckoutModel(
          id: doc.id,
          userId: doc['userId'],
          idDestination: doc['idDestination'],
          totalTraveler: doc['totalTraveler'],
          selectedSeats: List<String>.from(doc['selectedSeats']),
          insurance: doc['insurance'],
          refundable: doc['refundable'],
          vat: doc['vat'],
          price: doc['price'],
          grandTotal: doc['grandTotal'],
        );
      }).toList();
    } catch (e) {
      throw Exception("Failed to retrieve checkouts for userId $userId: $e");
    }
  }
}
