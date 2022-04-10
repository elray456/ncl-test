import 'package:chopper/chopper.dart';

part 'ncl_api.chopper.dart';

@ChopperApi()
abstract class NclApiService extends ChopperService {
  static const _url = 'https://www.ncl.com/cms-service/cruise-ships/';

  static NclApiService create() {
    final client = ChopperClient(
      baseUrl: _url,
      services: [_$NclApiService()],
      converter: const JsonConverter(),
    );
    return _$NclApiService(client);
  }

  @Get(path: 'SKY')
  Future<Response> getSkyData();

  @Get(path: 'BLISS')
  Future<Response> getBlissData();

  @Get(path: 'ESCAPE')
  Future<Response> getEscapeData();
}