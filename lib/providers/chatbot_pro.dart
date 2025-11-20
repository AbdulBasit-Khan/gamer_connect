import 'package:flutter/material.dart';
import 'package:gamerconnect/Models/chatbot_response_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotPro with ChangeNotifier {
  Future<void> sendChatRequest({required String prompt}) async {
    const url = "https://yunwu.ai/v1/chat/completions";
    const apiKey =
        "sk-T4dt5SPhC9Kv9Yrnzi9QDQdeSQMH4WmWaRZ32ehhVvRBzK9i"; // replace with your real key

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    };

    final body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": prompt},
      ],
      "temperature": 0.7,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ChatCompletionResponse res = ChatCompletionResponse.fromJson(data);
        print("Response: $data");
      } else {
        print("Error: ${response.statusCode}");
        print("Body: ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
