import 'package:flutter/material.dart';

// Encapsulates widgets used to present cruise ship data
class CruiseDataContainer extends StatelessWidget {
  final String? shipName, passengerCapacity, crew, inauguralDate;

  const CruiseDataContainer(
      {Key? key,
      required this.shipName,
      required this.passengerCapacity,
      required this.crew,
      required this.inauguralDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ship Name: $shipName'),
          Text('Passenger Capacity: $passengerCapacity'),
          Text('Crew: $crew'),
          Text('Inaugural Date: $inauguralDate'),
        ],
      ),
    );
  }
}
