part of 'escape_bloc.dart';

abstract class EscapeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EscapeDataLoad extends EscapeEvent {}
