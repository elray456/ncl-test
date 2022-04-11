import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_test/bloc/bliss/bliss_bloc.dart';

void main() {
  group('BlissBloc test', () {
    late BlissBloc blissBloc;

    setUp(() {
      blissBloc = BlissBloc();
    });

    blocTest(
      'emits [] when init state',
      build: () => blissBloc,
      expect: () => [],
    );

    blocTest(
      'emits [BlissDataLoading()] when BlissDataFetched is executed',
      build: () => blissBloc,
      act: (BlissBloc bloc) => bloc.add(BlissDataFetched()),
      expect: () => [BlissDataLoading()],
    );

    tearDown(() {
      blissBloc.close();
    });
  });
}
