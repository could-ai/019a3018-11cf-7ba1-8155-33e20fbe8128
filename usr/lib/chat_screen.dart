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
      return "The core problem is that businesses struggle to maintain consistent SEO rankings due to constant algorithm changes and manual optimization. Most existing SEO tools are static; they tell you what went wrong after your ranking drops, but they don’t predict or fix it. This leads to lost visibility, reduced traffic, and ultimately, lost revenue.";
    } else if (lowerCaseQuery.contains("solution") || lowerCaseQuery.contains("what is seo copilot") || lowerCaseQuery.contains("what does it do")) {
      return "SEO Copilot is an AI-driven system that continuously monitors SEO performance, predicts ranking changes before they happen, and autonomously optimizes your content. It uses advanced machine learning like Temporal Graph Neural Networks to forecast ranking drift and Reinforcement Learning to choose and apply the best optimization actions. It even explains its actions in simple human language using GPT models.";
    } else if (lowerCaseQuery.contains("architecture") || lowerCaseQuery.contains("how does it work")) {
      return "The architecture has five layers:\n1. Data Aggregation: Gathers SEO data from Google Search Console, Play Store, and crawlers.\n2. Knowledge Graph Construction: Connects keywords, pages, and rankings to see relationships.\n3. Predictive AI Engine: Uses Temporal Graph Neural Networks (TGNNs) to forecast ranking drift.\n4. Optimization Agent: Uses Reinforcement Learning to automatically adjust meta tags, headings, and run A/B tests.\n5. Dashboard: Visualizes insights and recommendations.";
    } else if (lowerCaseQuery.contains("tech stack") || lowerCaseQuery.contains("technology")) {
      return "The tech stack includes Python for development, PyTorch Geometric for TGNN modeling, GPT API for generating natural-language insights, Neo4j for the knowledge graph, and Streamlit for the interactive dashboard. It also uses Selenium and BeautifulSoup for data scraping.";
    } else if (lowerCaseQuery.contains("unique") || lowerCaseQuery.contains("differentiators")) {
      return "What makes SEO Copilot unique is that it doesn't just analyze—it acts autonomously. It combines Temporal Graph Neural Networks for prediction, Reinforcement Learning for decision-making, and LLMs for human-like explanations. It's like having a 24/7 autonomous SEO engineer.";
    } else if (lowerCaseQuery.contains("audience") || lowerCaseQuery.contains("who is it for")) {
      return "The target audience includes digital marketing agencies, app developers, e-commerce brands, and any business relying on online traffic. It helps them by automating tedious monitoring and testing, saving them time and turning SEO stress into SEO success.";
    } else if (lowerCaseQuery.contains("future") || lowerCaseQuery.contains("enhancements")) {
      return "Future plans are to make SEO Copilot even smarter with a voice-based SEO assistant, a Chrome extension for on-page analysis, and integration with Google Ads ROI tracking. The vision is to create a complete, autonomous growth platform.";
    } else if (lowerCaseQuery.contains("team") || lowerCaseQuery.contains("who made you")) {
      return "I was created based on a project by Team Hack Titans.";
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
