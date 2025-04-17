import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayDocument extends StatelessWidget {
  const DisplayDocument({super.key});

  @override
  Widget build(BuildContext context) {
    // Expecting arguments as a map: {'title': ..., 'imageUrl': ...}
    final Map<String, String> args = Get.arguments;
    final String title = args['title'] ?? 'Document';
    final String imageUrl = args['imageUrl'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: imageUrl.isNotEmpty
            ? InteractiveViewer(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
            errorBuilder: (context, error, stackTrace) {
              return const Text('Failed to load image');
            },
          ),
        )
            : const Text('No image URL provided'),
      ),
    );
  }
}
