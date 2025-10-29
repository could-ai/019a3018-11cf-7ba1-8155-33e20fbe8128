import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _addBotMessage("Hello! I'm the SEO Copilot assistant. Ask me anything about the project.");
  }

  void _addBotMessage(String text) {
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: false));
    });
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _controller.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: true));
    });

    String response = _getBotResponse(text);
    _addBotMessage(response);
  }

  String _getBotResponse(String query) {
    String lowerCaseQuery = query.toLowerCase();

    if (lowerCaseQuery.contains("problem") || lowerCaseQuery.contains("pain point")) {
      return "The core problem is that businesses struggle to maintain consistent SEO rankings due to constant algorithm changes and manual optimization. There’s no intelligent system that can predict ranking drops or automatically improve content in real time.";
    } else if (lowerCaseQuery.contains("solution") || lowerCaseQuery.contains("what is seo copilot") || lowerCaseQuery.contains("what does it do")) {
      return "SEO Copilot is an AI-driven agent that continuously monitors SEO metrics, predicts ranking shifts, and autonomously suggests or implements improvements using Temporal Graph Neural Networks and Reinforcement Learning.";
    } else if (lowerCaseQuery.contains("architecture") || lowerCaseQuery.contains("how does it work")) {
      return "The architecture has five layers: 1. Data Aggregation, 2. Knowledge Graph Construction, 3. A Predictive AI Engine (using TGNNs), 4. An Optimization Agent (using Reinforcement Learning), and 5. A Dashboard for visualization.";
    } else if (lowerCaseQuery.contains("tech stack") || lowerCaseQuery.contains("technology")) {
      return "The tech stack includes Python, BeautifulSoup, PyTorch Geometric, GPT API, NetworkX, MongoDB, Streamlit, Selenium, and Neo4j.";
    } else if (lowerCaseQuery.contains("unique") || lowerCaseQuery.contains("differentiators")) {
      return "What makes it unique is that it predicts ranking drift, automatically applies improvements via Reinforcement Learning, provides natural language explanations using LLMs, and unifies both Web and App SEO optimization.";
    } else if (lowerCaseQuery.contains("audience") || lowerCaseQuery.contains("who is it for")) {
      return "The target audience includes digital marketers, app developers, e-commerce companies, and SEO agencies who need to automate and improve their SEO efforts.";
    } else if (lowerCaseQuery.contains("future") || lowerCaseQuery.contains("enhancements")) {
      return "Future plans include a voice-based SEO assistant, a Chrome extension for instant analysis, and Google Ads ROI integration to create a complete AI marketing ecosystem.";
    } else if (lowerCaseQuery.contains("hello") || lowerCaseQuery.contains("hi")) {
      return "Hello! How can I help you with the SEO Copilot project today?";
    }

    return "I can answer questions about the SEO Copilot project. Try asking about the 'problem', 'solution', 'tech stack', or 'target audience'.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEO Copilot Bot"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final align =
        message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color =
        message.isUser ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary;
    final textColor = 
        message.isUser ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSecondary;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              message.text,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: "Send a message",
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
