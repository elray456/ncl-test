part of 'bliss_bloc.dart';

abstract class BlissEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BlissDataLoad extends BlissEvent {}
