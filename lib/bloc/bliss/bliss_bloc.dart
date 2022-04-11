import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/api/ncl_api.dart';
import 'package:ncl_test/models/bliss_model.dart';

part 'bliss_event.dart';

part 'bliss_state.dart';

class BlissBloc extends Bloc<BlissEvent, BlissState> {
  BlissBloc() : super(BlissInit()) {
    on<BlissDataFetched>(_mapSkyDataLoadToState);
  }

  void _mapSkyDataLoadToState(
      BlissDataFetched event, Emitter<BlissState> emit) async {
    BlissModel blissData;
    try {
      emit(BlissDataLoading());
      // Fetch BLISS cruiser data
      final Response<dynamic> blissDataRaw =
          await NclApiService.create().getBlissData();

      blissData = BlissModel(
        shipName: blissDataRaw.body['shipName'],
        passengerCapacity: blissDataRaw.body['shipFacts']['passengerCapacity'],
        crew: blissDataRaw.body['shipFacts']['crew'],
        inauguralDate: blissDataRaw.body['shipFacts']['inauguralDate'],
      );

      emit(BlissDataLoaded(blissData));
    } catch (error) {
      debugPrint('bliss_bloc error: $error');
      emit(BlissDataLoadError());
    }
  }
}
