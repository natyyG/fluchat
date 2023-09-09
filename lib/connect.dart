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
