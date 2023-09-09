void sendMessage(String message) async {
  final response = await supabase.from('messages').upsert([
    {
      'sender_id': senderUserId, // Your sender user ID
      'receiver_id': receiverUserId, // Your receiver user ID
      'message': message,
    },
  ]).execute();

  if (response.error != null) {
    print('Error sending message: ${response.error!.message}');
  } else {
    messageController.clear();
  }
}
