import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const supabaseUrl = 'YOUR_SUPABASE_URL';
const supabaseKey = 'YOUR_SUPABASE_KEY';

final supabase = SupabaseClient(supabaseUrl, supabaseKey);

void sendMessage(String message) async {
  var senderUserId;
  var receiverUserId;
  final response = await supabase.from('messages').upsert([
    {
      'sender_id': senderUserId,
      'receiver_id': receiverUserId,
      'message': message,
    },
  ]).execute();
  var messageController;
  messageController.clear();
}

// void subscribeToMessages() {
//   final subscription =
//       supabase.from('messages').on(SupabaseEventTypes.insert, (payload) {
//     final message = payload.newRecord['message'];
//     setState(() {
//       var messages;
//       messages.add(message);
//     });
//   }).subscribe();
// }



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _messageStream =
//       Supabase.instance.client.from("mesages").stream(primaryKey: ["id"]);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Your priority")),
//       body: Column(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 500,
//                 child: StreamBuilder<List<Map<String, dynamic>>>(
//                   stream: _messageStream,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Error: ${snapshot.error}'),
//                       );
//                     }
//                     if (!snapshot.hasData) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     final messages = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: messages.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(messages[index]['message']),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           TextFormField(
//             onFieldSubmitted: (value) async {
//               await Supabase.instance.client.from('mesages').insert(
//                 {
//                   'user_id': '1',
//                   'message': value,
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

