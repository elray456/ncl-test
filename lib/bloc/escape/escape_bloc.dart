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

  void _mapSkyDataLoadToState(
      EscapeDataLoad event, Emitter<EscapeState> emit) async {
    EscapeModel escapeData = EscapeModel();
    try {
      final Response<dynamic> escapeDataRaw =
          await NclApiService.create().getEscapeData();

      escapeData.shipName = escapeDataRaw.body['shipName'];
      escapeData.passengerCapacity =
          escapeDataRaw.body['shipFacts']['passengerCapacity'];
      escapeData.crew = escapeDataRaw.body['shipFacts']['crew'];
      escapeData.inauguralDate =
          escapeDataRaw.body['shipFacts']['inauguralDate'];

      log('is empty ${escapeData.shipName}');

      emit(EscapeDataLoaded(escapeData));
    } catch (error) {
      debugPrint('sky_bloc error: $error');
      emit(EscapeDataLoadError());
    }
  }
}
