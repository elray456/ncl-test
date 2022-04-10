import 'dart:developer';

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
    SkyModel skyData = SkyModel();
    try {
      final Response<dynamic> skyDataRaw =
          await NclApiService.create().getSkyData();

      log('sky bloc: ${skyDataRaw.body['shipName']}');
      log('sky bloc: ${skyDataRaw.body['shipFacts']['passengerCapacity'].runtimeType}');
      log('sky bloc: ${skyDataRaw.body['shipFacts']['crew'].runtimeType}');
      log('sky bloc: ${skyDataRaw.body['shipFacts']['inauguralDate'].runtimeType}');

      skyData.shipName = skyDataRaw.body['shipName'];
      skyData.passengerCapacity =
      skyDataRaw.body['shipFacts']['passengerCapacity'];
      skyData.crew = skyDataRaw.body['shipFacts']['crew'];
      skyData.inauguralDate = skyDataRaw.body['shipFacts']['inauguralDate'];

      log('is empty ${skyData.shipName}');

      emit(SkyDataLoaded(skyData));
    } catch (error) {
      debugPrint('sky_bloc error: $error');
    }
  }
}
