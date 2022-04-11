import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/api/ncl_api.dart';
import 'package:ncl_test/models/escape_model.dart';

part 'escape_event.dart';

part 'escape_state.dart';

class EscapeBloc extends Bloc<EscapeEvent, EscapeState> {
  EscapeBloc() : super(EscapeInit()) {
    on<EscapeDataFetched>(_mapSkyDataLoadToState);
  }

  void _mapSkyDataLoadToState(
      EscapeDataFetched event, Emitter<EscapeState> emit) async {
    EscapeModel escapeData;
    try {
      emit(EscapeDataLoading());

      // Fetch ESCAPE cruiser data
      final Response<dynamic> escapeDataRaw =
          await NclApiService.create().getEscapeData();

      escapeData = EscapeModel(
        shipName: escapeDataRaw.body['shipName'],
        passengerCapacity: escapeDataRaw.body['shipFacts']['passengerCapacity'],
        crew: escapeDataRaw.body['shipFacts']['crew'],
        inauguralDate: escapeDataRaw.body['shipFacts']['inauguralDate'],
      );

      emit(EscapeDataLoaded(escapeData));
    } catch (error) {
      debugPrint('escape_bloc error: $error');
      emit(EscapeDataLoadError());
    }
  }
}
