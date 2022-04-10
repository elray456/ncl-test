import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/bloc/escape/escape_bloc.dart';

class EscapeScreen extends StatefulWidget {
  const EscapeScreen({Key? key}) : super(key: key);

  @override
  State<EscapeScreen> createState() => _EscapeScreenState();
}

class _EscapeScreenState extends State<EscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EscapeBloc()..add(EscapeDataLoad()),
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ship Name: ${state.escapeData?.shipName}'),
                    Text('Passenger Capacity: ${state.escapeData?.passengerCapacity}'),
                    Text('Crew: ${state.escapeData?.crew}'),
                    Text('Inaugural Date: ${state.escapeData?.inauguralDate}'),
                  ],
                ),
              );
            }
            if (state is EscapeDataLoadError) {
              return const Center(child: Text('Error'));
            }
            return const Text('Some Error');
          },
        ),
      ),
    );
  }
}
