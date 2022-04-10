import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/api/ncl_api.dart';
import 'package:ncl_test/models/bliss_model.dart';

part 'bliss_event.dart';

part 'bliss_state.dart';

class BlissBloc extends Bloc<BlissEvent, BlissState> {
  BlissBloc() : super(BlissDataLoading()) {
    on<BlissDataLoad>(_mapSkyDataLoadToState);
  }

  void _mapSkyDataLoadToState(BlissDataLoad event, Emitter<BlissState> emit) async {
    BlissModel blissData = BlissModel();
    try {
      final Response<dynamic> blissDataRaw =
      await NclApiService.create().getBlissData();

      log('sky bloc: ${blissDataRaw.body['shipName']}');
      log('sky bloc: ${blissDataRaw.body['shipFacts']['passengerCapacity'].runtimeType}');
      log('sky bloc: ${blissDataRaw.body['shipFacts']['crew'].runtimeType}');
      log('sky bloc: ${blissDataRaw.body['shipFacts']['inauguralDate'].runtimeType}');

      blissData.shipName = blissDataRaw.body['shipName'];
      blissData.passengerCapacity =
      blissDataRaw.body['shipFacts']['passengerCapacity'];
      blissData.crew = blissDataRaw.body['shipFacts']['crew'];
      blissData.inauguralDate = blissDataRaw.body['shipFacts']['inauguralDate'];

      log('is empty ${blissData.shipName}');

      emit(BlissDataLoaded(blissData));
    } catch (error) {
      debugPrint('sky_bloc error: $error');
    }
  }
}
