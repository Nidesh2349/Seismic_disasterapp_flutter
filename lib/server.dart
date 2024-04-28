import 'dart:async';

import 'dart:math';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<void> main() async {
  // Create a shelf handler to handle incoming requests
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_generateRandomNumber);

  // Start the server on port 8080
  var server = await shelf_io.serve(handler, 'localhost', 9080);
  print('Server listening on port ${server.port}');
}

// Handler function to generate a random number and return it as a response
Future<Response> _generateRandomNumber(Request request) async {
  // Generate a random number from 1 to 9
  var randomNumber = Random().nextInt(9) + 1;

  // Return the random number as a response
  return Response.ok('$randomNumber');
}
