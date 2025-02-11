import 'package:flutter/material.dart';

class OrderTimeline extends StatelessWidget {
  final String status;

  const OrderTimeline({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final stages = [
      {
        'title': 'Order Placed',
        'description': 'Your order has been placed successfully',
        'icon': Icons.shopping_bag_outlined
      },
      {
        'title': 'Processing',
        'description': 'We are preparing your order',
        'icon': Icons.pending_outlined
      },
      {
        'title': 'Shipped',
        'description': 'Your order is on the way',
        'icon': Icons.local_shipping_outlined
      },
      {
        'title': 'Delivered',
        'description': 'Order has been delivered',
        'icon': Icons.check
      },
    ];
    final currentIndex = _getStatusIndex(status);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: stages.length,
      itemBuilder: (context, index) {
        final isCompleted = index <= currentIndex;
        final isActive = index == currentIndex;
        final isLast = index == stages.length - 1;
        final stageTitle = stages[index]['title'] as String;

        return IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(width: 20),
              // Timeline line and dot
              Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted
                          ? _getStatusColor(stageTitle)
                          : Colors.grey[300],
                      border: isActive
                          ? Border.all(
                              color: _getStatusColor(stageTitle), width: 3)
                          : null,
                    ),
                    child: Icon(
                      stages[index]['icon'] as IconData,
                      color: isCompleted ? Colors.white : Colors.grey[400],
                      size: 16,
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 50,
                      color: isCompleted ? Colors.green : Colors.grey[300],
                    ),
                ],
              ),
              SizedBox(width: 20),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stageTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                        color: isCompleted ? Colors.black : Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      stages[index]['description'] as String,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (!isLast) SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int _getStatusIndex(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return 1;
      case 'shipped':
        return 2;
      case 'delivered':
        return 3;
      default:
        return 0;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return Colors.blue;
      case 'shipped':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
