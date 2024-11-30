import 'package:bloc/bloc.dart';

class Seat {
  final bool isAvailable;
  final bool isUnavailable;
  final bool isSelected;

  Seat({
    required this.isAvailable,
    required this.isUnavailable,
    required this.isSelected,
  });

  Seat copyWith({
    bool? isAvailable,
    bool? isUnavailable,
    bool? isSelected,
  }) {
    return Seat(
      isAvailable: isAvailable ?? this.isAvailable,
      isUnavailable: isUnavailable ?? this.isUnavailable,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class SeatCubit extends Cubit<Map<int, Map<int, Seat>>> {
  SeatCubit()
      : super({
          1: {
            1: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            2: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            3: Seat(isAvailable: true, isUnavailable: false, isSelected: false),
            4: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
          },
          2: {
            1: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            2: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            3: Seat(isAvailable: true, isUnavailable: false, isSelected: false),
            4: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
          },
          3: {
            1: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            2: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            3: Seat(isAvailable: true, isUnavailable: false, isSelected: false),
            4: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
          },
          4: {
            1: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            2: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
            3: Seat(isAvailable: true, isUnavailable: false, isSelected: false),
            4: Seat(isAvailable: false, isUnavailable: true, isSelected: false),
          },
        });

  void setSeat(int row, int number) {
    // Create a deep copy of the current state
    final newState = <int, Map<int, Seat>>{};
    state.forEach((rowKey, seats) {
      newState[rowKey] = Map<int, Seat>.from(seats);
    });

    // Get the current seat
    final currentSeat = newState[row]![number]!;

    // Toggle the 'isSelected' property
    final updatedSeat = currentSeat.copyWith(
      isSelected: !currentSeat.isSelected,
    );

    // Update the seat in the new state
    newState[row]![number] = updatedSeat;

    // Emit the new state
    emit(newState);
  }
}
