import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncl_test/api/ncl_api.dart';
import 'package:ncl_test/models/sky_model.dart';

part 'sky_event.dart';

part 'sky_state.dart';

class SkyBloc extends Bloc<SkyEvent, SkyState> {
  SkyBloc() : super(SkyDataLoading()) {
    on<SkyDataLoad>(_mapSkyDataLoadToState);
  }

  void _mapSkyDataLoadToState(SkyDataLoad event, Emitter<SkyState> emit) async {
    SkyModel skyData;
    try {
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
