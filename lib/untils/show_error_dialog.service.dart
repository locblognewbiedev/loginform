import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, List<String> messages) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Cảnh báo'),
        content: SingleChildScrollView(
          child: Container(
            constraints:
                const BoxConstraints(maxHeight: 100), // Giới hạn chiều cao
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: messages.map((message) {
                return Text(
                  message,
                  style: const TextStyle(
                      fontSize: 14), // Điều chỉnh kích thước font
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
