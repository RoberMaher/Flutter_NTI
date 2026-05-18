import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final GlobalKey<FormState> formKey;

  const CustomFormField({
    required this.text,
    required this.icon,
    required this.controller,
    required this.formKey,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 30),
              Icon(icon, color: Colors.white, size: 15),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: controller,
              obscureText: isPassword,
              style: const TextStyle(color: Colors.white),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "$text Can't Be Empty";
                }

                if (!isPassword && !value.contains("@")) {
                  return "Invalid Email";
                }

                if (isPassword && value.length < 6) {
                  return "Password must be at least 6 characters";
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter $text",
                hintStyle: const TextStyle(color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}