import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/bloc/bliss/bliss_bloc.dart';
import 'package:ncl_test/screens/error_screen.dart';
import 'package:ncl_test/widgets/cruise_data_container.dart';

class BlissScreen extends StatefulWidget {
  const BlissScreen({Key? key}) : super(key: key);

  @override
  State<BlissScreen> createState() => _BlissScreenState();
}

class _BlissScreenState extends State<BlissScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BlissBloc()..add(BlissDataFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLISS'),
        ),
        body: BlocBuilder<BlissBloc, BlissState>(
          builder: (BuildContext context, BlissState state) {
            debugPrint('state is: $state');
            if (state is BlissDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BlissDataLoaded) {
              return CruiseDataContainer(
                shipName: state.blissData?.shipName,
                passengerCapacity: state.blissData?.passengerCapacity,
                crew: state.blissData?.crew,
                inauguralDate: state.blissData?.inauguralDate,
              );
            }
            if (state is BlissDataLoadError) {
              return const ErrorScreen();
            }
            return const ErrorScreen();
          },
        ),
      ),
    );
  }
}
