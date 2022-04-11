import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/bloc/escape/escape_bloc.dart';
import 'package:ncl_test/screens/error_screen.dart';
import 'package:ncl_test/widgets/cruise_data_container.dart';

class EscapeScreen extends StatefulWidget {
  const EscapeScreen({Key? key}) : super(key: key);

  @override
  State<EscapeScreen> createState() => _EscapeScreenState();
}

class _EscapeScreenState extends State<EscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EscapeBloc()..add(EscapeDataFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ESCAPE'),
        ),
        body: BlocBuilder<EscapeBloc, EscapeState>(
          builder: (BuildContext context, EscapeState state) {
            debugPrint('state is: $state');
            if (state is EscapeDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EscapeDataLoaded) {
              return CruiseDataContainer(
                shipName: state.escapeData?.shipName,
                passengerCapacity: state.escapeData?.passengerCapacity,
                crew: state.escapeData?.crew,
                inauguralDate: state.escapeData?.inauguralDate,
              );
            }
            if (state is EscapeDataLoadError) {
              return const ErrorScreen();
            }
            return const ErrorScreen();
          },
        ),
      ),
    );
  }
}
