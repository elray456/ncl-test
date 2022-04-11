import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_test/bloc/escape/escape_bloc.dart';

void main() {
  group('EscapeBloc test', () {
    late EscapeBloc skyBloc;

    setUp(() {
      skyBloc = EscapeBloc();
    });

    blocTest(
      'emits [] when init state',
      build: () => skyBloc,
      expect: () => [],
    );

    blocTest(
      'emits [EscapeDataLoading()] when EscapeDataFetched is added',
      build: () => skyBloc,
      act: (EscapeBloc bloc) => bloc.add(EscapeDataFetched()),
      expect: () => [EscapeDataLoading()],
    );

    tearDown(() {
      skyBloc.close();
    });
  });
}
