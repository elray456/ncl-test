import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/bloc/sky/sky_bloc.dart';

class SkyScreen extends StatefulWidget {
  const SkyScreen({Key? key}) : super(key: key);

  @override
  State<SkyScreen> createState() => _SkyScreenState();
}

class _SkyScreenState extends State<SkyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SkyBloc()..add(SkyDataLoad()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SKY'),
        ),
        body: BlocBuilder<SkyBloc, SkyState>(
          builder: (BuildContext context, SkyState state) {
            debugPrint('state is: $state');
            if (state is SkyDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SkyDataLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ship Name: ${state.skyData?.shipName}'),
                    Text('Passenger Capacity: ${state.skyData?.passengerCapacity}'),
                    Text('Crew: ${state.skyData?.crew}'),
                    Text('Inaugural Date: ${state.skyData?.inauguralDate}'),
                  ],
                ),
              );
            }
            if (state is SkyDataLoadError) {
              return const Center(child: Text('Error'));
            }
            return const Text('Some Error');
          },
        ),
      ),
    );
  }
}
