import 'package:flutter/material.dart';

class ComplaintTableRow extends StatelessWidget {
  final String name;
  final String email;
  final String complaint;

  const ComplaintTableRow({
    required this.name,
    required this.email,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(name)),
          Expanded(child: Text(email)),
          Expanded(child: Text(complaint)),
        ],
      ),
    );
  }
}
