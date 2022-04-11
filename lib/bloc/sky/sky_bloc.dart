import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/api/ncl_api.dart';
import 'package:ncl_test/models/sky_model.dart';

part 'sky_event.dart';

part 'sky_state.dart';

class EscapeBloc extends Bloc<SkyEvent, SkyState> {
  EscapeBloc() : super(SkyInit()) {
    on<SkyDataFetched>(mapSkyDataLoadToState);
  }

  void mapSkyDataLoadToState(SkyDataFetched event, Emitter<SkyState> emit) async {
    SkyModel skyData;
    try {
      emit(SkyDataLoading());

      // Fetch SKY cruiser data
      final Response<dynamic> skyDataRaw =
          await NclApiService.create().getSkyData();

      skyData = SkyModel(
        shipName: skyDataRaw.body['shipName'],
        passengerCapacity: skyDataRaw.body['shipFacts']['passengerCapacity'],
        crew: skyDataRaw.body['shipFacts']['crew'],
        inauguralDate: skyDataRaw.body['shipFacts']['inauguralDate'],
      );

      emit(SkyDataLoaded(skyData));
    } catch (error) {
      debugPrint('sky_bloc error: $error');
      emit(SkyDataLoadError());
    }
  }
}
