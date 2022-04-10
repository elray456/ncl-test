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
    return Scaffold(
      appBar: AppBar(
        title: const Text('SKY'),
      ),
      body: BlocBuilder<SkyBloc, SkyState>(
        builder: (BuildContext context, SkyState state) {
          if (state is SkyDataLoading) {
            return const CircularProgressIndicator();
          }
          if (state is SkyDataLoaded) {
            return const Text('SKY');
          }
          if (state is SkyDataLoadError) {
            return const Text('Error');
          }
          return const Text('Some Error');
        },
      ),
    );
  }
}
