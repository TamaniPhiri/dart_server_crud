import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getUsers(),
    _ => Future.value(Response.json(body: 'Default method'))
  };
}

Future<Response> _getUsers() {
  return Future.value(
    Response.json(
      body: [
        {'name': 'Tamani Sam'},
      ],
    ),
  );
}
