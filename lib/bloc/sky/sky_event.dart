part of 'sky_bloc.dart';

abstract class SkyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SkyDataLoad extends SkyEvent {}
