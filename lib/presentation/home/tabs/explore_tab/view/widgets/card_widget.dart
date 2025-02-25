import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
   String icon;
   String name;
   String id;
   void Function()? onTap;
   CardWidget({required this.id,required this.icon,required this.name,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Image.network(
          icon,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.broken_image,
                  color: Colors.grey),
        ),
        title: Text(name),

        onTap: onTap,
      ),
    );;
  }
}
