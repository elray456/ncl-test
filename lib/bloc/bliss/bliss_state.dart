part of 'bliss_bloc.dart';

@immutable
abstract class BlissState extends Equatable {}

class BlissDataLoading extends BlissState {

  @override
  List<Object?> get props => [];
}

class BlissDataLoaded extends BlissState {
  final BlissModel? blissData;

  BlissDataLoaded(this.blissData);

  @override
  List<Object?> get props => [blissData];
}

class BlissDataLoadError extends BlissState {
  @override
  List<Object?> get props => [];
}