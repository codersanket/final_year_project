import 'package:final_year_project/infrastructure/repo/auth_repo.dart';
import 'package:flutter/material.dart';

class CustomButtonRow extends StatelessWidget {
  const CustomButtonRow({
    Key? key,
    this.isLoginPage = true,
    required this.onTap
  }) : super(key: key);
  final bool isLoginPage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isLoginPage ? "Sign in" : "Sign up",
            style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: MaterialButton(
                color: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: onTap,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
