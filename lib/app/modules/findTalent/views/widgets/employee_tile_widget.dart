import 'package:flutter/material.dart';

class EmployeeTileWidget extends StatelessWidget {
  const EmployeeTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
              radius: 30,
            ),
            title: Text(
              'I am a web developer',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.all(5),
              child: Text('total earned :\$200'),
            ),
            trailing: const CircleAvatar(
              radius: 20,
              child: Icon(Icons.bookmark_outline, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
