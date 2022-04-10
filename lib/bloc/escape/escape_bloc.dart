import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/api/ncl_api.dart';
import 'package:ncl_test/models/escape_model.dart';

part 'escape_event.dart';

part 'escape_state.dart';

class EscapeBloc extends Bloc<EscapeEvent, EscapeState> {
  EscapeBloc() : super(EscapeDataLoading()) {
    on<EscapeDataLoad>(_mapSkyDataLoadToState);
  }

  void _mapSkyDataLoadToState(EscapeDataLoad event, Emitter<EscapeState> emit) async {
    EscapeModel escapeData = EscapeModel();
    try {
      final Response<dynamic> skyDataRaw =
      await NclApiService.create().getSkyData();

      log('sky bloc: ${skyDataRaw.body['shipName']}');
      log('sky bloc: ${skyDataRaw.body['shipFacts']['passengerCapacity'].runtimeType}');
      log('sky bloc: ${skyDataRaw.body['shipFacts']['crew'].runtimeType}');
      log('sky bloc: ${skyDataRaw.body['shipFacts']['inauguralDate'].runtimeType}');

      escapeData.shipName = skyDataRaw.body['shipName'];
      escapeData.passengerCapacity =
      skyDataRaw.body['shipFacts']['passengerCapacity'];
      escapeData.crew = skyDataRaw.body['shipFacts']['crew'];
      escapeData.inauguralDate = skyDataRaw.body['shipFacts']['inauguralDate'];

      log('is empty ${escapeData.shipName}');

      emit(EscapeDataLoaded(escapeData));
    } catch (error) {
      debugPrint('sky_bloc error: $error');
      emit(EscapeDataLoadError());
    }
  }
}
