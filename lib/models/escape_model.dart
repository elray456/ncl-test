import 'package:equatable/equatable.dart';

class EscapeModel extends Equatable {
  final String shipName;
  final String passengerCapacity;
  final String crew;
  final String inauguralDate;

  const EscapeModel({
    required this.shipName,
    required this.passengerCapacity,
    required this.crew,
    required this.inauguralDate,
  });

  @override
  List<Object?> get props => [shipName, passengerCapacity, crew, inauguralDate];
}