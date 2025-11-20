class ChatCompletionResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
  final String systemFingerprint;

  ChatCompletionResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.systemFingerprint,
  });

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) {
    return ChatCompletionResponse(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices: (json['choices'] as List)
          .map((e) => Choice.fromJson(e))
          .toList(),
      usage: Usage.fromJson(json['usage']),
      systemFingerprint: json['system_fingerprint'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": choices.map((e) => e.toJson()).toList(),
        "usage": usage.toJson(),
        "system_fingerprint": systemFingerprint,
      };
}

class Choice {
  final int index;
  final Message message;
  final dynamic logprobs;
  final String finishReason;

  Choice({
    required this.index,
    required this.message,
    required this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      index: json['index'],
      message: Message.fromJson(json['message']),
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "logprobs": logprobs,
        "finish_reason": finishReason,
      };
}

class Message {
  final String role;
  final String content;
  final dynamic refusal;
  final List<dynamic> annotations;

  Message({
    required this.role,
    required this.content,
    required this.refusal,
    required this.annotations,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      content: json['content'],
      refusal: json['refusal'],
      annotations: List<dynamic>.from(json['annotations']),
    );
  }

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
        "refusal": refusal,
        "annotations": annotations,
      };
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;
  final TokenDetails promptTokensDetails;
  final TokenDetails completionTokensDetails;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
    required this.promptTokensDetails,
    required this.completionTokensDetails,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
      promptTokensDetails:
          TokenDetails.fromJson(json['prompt_tokens_details']),
      completionTokensDetails:
          TokenDetails.fromJson(json['completion_tokens_details']),
    );
  }

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
        "prompt_tokens_details": promptTokensDetails.toJson(),
        "completion_tokens_details": completionTokensDetails.toJson(),
      };
}

class TokenDetails {
  final int cachedTokens;
  final int audioTokens;
  final int? reasoningTokens;
  final int? acceptedPredictionTokens;
  final int? rejectedPredictionTokens;

  TokenDetails({
    required this.cachedTokens,
    required this.audioTokens,
    this.reasoningTokens,
    this.acceptedPredictionTokens,
    this.rejectedPredictionTokens,
  });

  factory TokenDetails.fromJson(Map<String, dynamic> json) {
    return TokenDetails(
      cachedTokens: json['cached_tokens'] ?? 0,
      audioTokens: json['audio_tokens'] ?? 0,
      reasoningTokens: json['reasoning_tokens'],
      acceptedPredictionTokens: json['accepted_prediction_tokens'],
      rejectedPredictionTokens: json['rejected_prediction_tokens'],
    );
  }

  Map<String, dynamic> toJson() => {
        "cached_tokens": cachedTokens,
        "audio_tokens": audioTokens,
        if (reasoningTokens != null) "reasoning_tokens": reasoningTokens,
        if (acceptedPredictionTokens != null)
          "accepted_prediction_tokens": acceptedPredictionTokens,
        if (rejectedPredictionTokens != null)
          "rejected_prediction_tokens": rejectedPredictionTokens,
      };
}
