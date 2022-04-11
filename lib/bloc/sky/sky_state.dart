part of 'sky_bloc.dart';

@immutable
abstract class SkyState extends Equatable {}

class SkyInit extends SkyState {
  @override
  List<Object?> get props => [];
}

class SkyDataLoading extends SkyState {
  @override
  List<Object?> get props => [];
}

class SkyDataLoaded extends SkyState {
  final SkyModel? skyData;

  SkyDataLoaded(this.skyData);

  @override
  List<Object?> get props => [skyData];
}

class SkyDataLoadError extends SkyState {
  @override
  List<Object?> get props => [];
}
