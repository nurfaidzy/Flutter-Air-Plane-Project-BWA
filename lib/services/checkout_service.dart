import 'package:air_plane/models/checkout_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutService {
  final CollectionReference _checkoutReference =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> setCheckout(CheckoutModel checkout) async {
    try {
      await _checkoutReference.doc(checkout.id).set({
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
      throw e;
    }
  }

  Future<CheckoutModel> getCheckout(String id) async {
    try {
      DocumentSnapshot snapshot = await _checkoutReference.doc(id).get();
      return CheckoutModel(
        id: id,
        idDestination: snapshot['idDestination'],
        totalTraveler: snapshot['totalTraveler'],
        selectedSeats: snapshot['selectedSeats'],
        insurance: snapshot['insurance'],
        refundable: snapshot['refundable'],
        vat: snapshot['vat'],
        price: snapshot['price'],
        grandTotal: snapshot['grandTotal'],
      );
    } catch (e) {
      throw e;
    }
  }
}
