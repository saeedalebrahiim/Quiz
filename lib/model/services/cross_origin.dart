import 'dart:async';

import 'package:chopper/chopper.dart';

class AccessOriginHeader implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Access-Control-Allow-Origin', '*');
  }
}

class StreamByte implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Content-Type', 'application/octet-stream');
  }
}
