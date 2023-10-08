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
        {'name': 'Tamani Sam', 'email': 'tamani@gmail.com'},
        {'name': 'Troy Mac', 'email': 'troy@troymac.com'},
      ],
    ),
  );
}

Future<Response> _createUser(RequestContext context) async {
  final json = (await context.request.json()) as Map<String, dynamic>;
  final name = json['name'];
  final email = json['email'];
  return Response.json(
    body: {
      'message': 'User created',
      'name': name,
      'email': email,
    },
  );
}
