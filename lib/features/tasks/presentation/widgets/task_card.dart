import 'package:flutter/material.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.username,
    required this.location,
    required this.department,
    required this.assignTo,
  });
  final String username;
  final String location;
  final String department;
  final String assignTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        color: whiteColor.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      department,
                      style: TextStyle(
                        color: whiteColor.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Assign To',
                      style: TextStyle(
                        color: whiteColor.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      assignTo,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: whiteColor.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
