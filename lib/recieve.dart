import 'package:chat_app/connect.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void subscribeToMessages() {
  final subscription =
      supabase.from('messages').on(SupabaseEventTypes.insert, (payload) {
    final message = payload.newRecord['message'];
    setState(() {
      var messages;
      messages.add(message);
    });
  }).subscribe();
}
