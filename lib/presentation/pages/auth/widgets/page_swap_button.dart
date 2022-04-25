import 'package:flutter/material.dart';

class PageSwapButton extends StatelessWidget {
  const PageSwapButton({Key? key, required this.valueNotifier})
      : super(key: key);

  final ValueNotifier<bool> valueNotifier;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        onPressed: () {
          valueNotifier.value = !valueNotifier.value;
        },
        child: Text(
          !valueNotifier.value ? "Sign up" : "Sign in",
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black54),
        ),
      ),
    );
  }
}
