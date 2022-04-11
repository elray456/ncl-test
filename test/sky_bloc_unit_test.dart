import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_test/bloc/sky/sky_bloc.dart';

void main() {
  group('SkyBloc test', () {
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
      'emits [SkyDataLoading()] when SkyDataFetched is is executed',
      build: () => skyBloc,
      act: (EscapeBloc bloc) => bloc.add(SkyDataFetched()),
      expect: () => [SkyDataLoading()],
    );

    tearDown(() {
      skyBloc.close();
    });
  });
}
