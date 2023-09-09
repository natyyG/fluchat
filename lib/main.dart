import 'package:chat_app/chat_page.dart';
import 'package:chat_app/connect.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var SUPABASE_URL = "";
  var SUPABASE_ANON_KEY = "";
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ur Priority',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _messageStream =
      Supabase.instance.client.from("mesages").stream(primaryKey: ["id"]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your priority")),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 500,
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _messageStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final messages = snapshot.data!;
                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(messages[index]['message']),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            onFieldSubmitted: (value) async {
              await Supabase.instance.client.from('mesages').insert(
                {
                  'user_id': '1',
                  'message': value,
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
