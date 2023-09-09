// void sendMessage(String message) async {
//   final response = await supabase.from('messages').upsert([
//     {
//       'sender_id': senderUserId, // Your sender user ID
//       'receiver_id': receiverUserId, // Your receiver user ID
//       'message': message,
//     },
//   ]).execute();

//   if (response.error != null) {
//     print('Error sending message: ${response.error!.message}');
//   } else {
//     messageController.clear();
//   }
// }


// Scaffold(
//       appBar: AppBar(
//         title: Text('Chat App'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type a message',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     sendMessage("message");
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
