part of 'escape_bloc.dart';

@immutable
abstract class EscapeState extends Equatable {}

class EscapeDataLoading extends EscapeState {

  @override
  List<Object?> get props => [];
}

class EscapeDataLoaded extends EscapeState {
  final EscapeModel? escapeData;

  EscapeDataLoaded(this.escapeData);

  @override
  List<Object?> get props => [escapeData];
}

class EscapeDataLoadError extends EscapeState {
  @override
  List<Object?> get props => [];
}