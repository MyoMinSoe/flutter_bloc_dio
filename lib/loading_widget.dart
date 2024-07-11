import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            strokeWidth: 50,
            valueColor: const AlwaysStoppedAnimation(Colors.green),
            backgroundColor: Colors.greenAccent.withOpacity(0.3),
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            backgroundColor: Colors.cyan.withOpacity(0.5),
            color: Colors.blue,
            minHeight: 30,
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ],
    );
  }
}
