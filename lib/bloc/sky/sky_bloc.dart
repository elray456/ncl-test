import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/models/sky_model.dart';

part 'sky_event.dart';

part 'sky_state.dart';

class SkyBloc extends Bloc<SkyEvent, SkyState> {
  SkyBloc() : super(SkyDataLoading()) {
    on<SkyDataLoad>(_mapSkyDataLoadToState);
  }

  void _mapSkyDataLoadToState(
      SkyDataLoad event, Emitter<SkyState> emit) async {
    SkyModel? skyData;
    try {
      Map<String, dynamic> skyData;
    } catch (error) {
      debugPrint('sky_bloc error: $error');
    }
  }
}
