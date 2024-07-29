import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 50,
            valueColor: const AlwaysStoppedAnimation(Colors.green),
            backgroundColor: Colors.greenAccent.withOpacity(0.3),
          ),
        ),
        const SizedBox(height: 80),
        Text(
          'Loading',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: LinearProgressIndicator(
            backgroundColor: Colors.cyan.withOpacity(0.5),
            color: Colors.blue,
            minHeight: 40,
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ],
    );
  }
}
