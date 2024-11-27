import 'package:air_plane/models/places_model.dart';
import 'package:bloc/bloc.dart';

class PlacesCubit extends Cubit<PlacesModel> {
  PlacesCubit()
      : super(PlacesModel(
          id: 0,
          name: "",
          city: "",
          image: "",
          rating: 0.0,
          price: 0,
        ));

  void setPlace(PlacesModel newPlace) {
    emit(newPlace);
  }
}
