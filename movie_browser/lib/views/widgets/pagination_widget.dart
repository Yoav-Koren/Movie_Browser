import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // Previous page logic
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const Text(
            "Page 1 of 5",
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              // Next page logic
            },
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
