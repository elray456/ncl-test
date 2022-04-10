// import 'package:chopper/chopper.dart';
//
// @ChopperApi()
// abstract class SkyApiService extends ChopperService {
//   static const _url = 'https://www.ncl.com/cms-service/cruise-ships/SKY';
//
//   static SkyApiService create() {
//     final client = ChopperClient(
//       baseUrl: _url,
//       services: [_$SkyApiService()],
//       converter: const JsonConverter(),
//     );
//     return _$SkyApiService(client);
//   }
//
//   @Get(path: '')
//   Future<Response> getSkyData();
// }