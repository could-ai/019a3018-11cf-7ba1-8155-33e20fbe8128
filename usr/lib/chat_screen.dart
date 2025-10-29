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
      return "Businesses today struggle to maintain SEO and app rankings across multiple platforms like Google, Play Store, and the web. Manual optimization is slow, reactive, and often based on guesswork. There’s also a lack of predictive intelligence — companies only notice ranking drops after they happen. This creates a strong need for a system that can monitor, predict, and automatically optimize SEO in real time.";
    } else if (lowerCaseQuery.contains("solution") || lowerCaseQuery.contains("what is seo copilot") || lowerCaseQuery.contains("what does it do")) {
      return "Our solution, SEO Copilot, is an AI-driven system that continuously tracks SEO metrics, predicts ranking drifts before they occur, and autonomously suggests or even implements optimizations. It combines Temporal Graph Neural Networks (TGNNs) for prediction and Reinforcement Learning for decision-making. Using LLMs like GPT, it can also explain these actions in simple human language.";
    } else if (lowerCaseQuery.contains("architecture") || lowerCaseQuery.contains("how does it work")) {
      return "Here’s how it works in five layers:\n\n1. Data Aggregation Layer – Gathers SEO data from sources like Google Search Console, Play Store, and crawlers.\n2. Knowledge Graph – Connects pages, keywords, and rankings to reveal dependencies.\n3. Predictive AI Engine – Uses TGNNs to forecast ranking drift.\n4. Optimization Agent – Uses Reinforcement Learning to apply smart changes like rewriting metadata or headings.\n5. Dashboard – Visualizes performance, trends, and AI-generated suggestions.";
    } else if (lowerCaseQuery.contains("tech stack") || lowerCaseQuery.contains("technology")) {
      return "Our implementation uses a strong technology stack:\n\n- Python for development,\n- PyTorch Geometric for TGNN modeling,\n- GPT API for generating natural-language insights,\n- Streamlit for the interactive dashboard,\n- Neo4j for storing and managing the Knowledge Graph,\n- And Selenium and BeautifulSoup for data scraping and crawling.";
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
