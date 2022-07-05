import 'dart:html';

import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'my_app.dart';

final apiKey = "240343f9-682d-4570-a8b9-361f3eefda37";
final userToken =
    "78awft3wfypzgsnn72kskkh3j7kjpcudqxq6w8q3hm6hd58sqk2mz4uv78w7p7a7";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Stream chat client
  final client = StreamChatClient(apiKey, logLevel: Level.INFO);

  //Current User
  await client.connectUser(User(id: "ChatApp"), userToken);

  //Get channel
  final channel = client.channel("messaging", id: "flutterdevs");

  await channel.watch();

  runApp(MyApp(client: client, channel: channel));
}
