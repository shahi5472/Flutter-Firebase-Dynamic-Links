import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    Key? key,
    required this.index,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final int index;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Image.network(
            "https://picsum.photos/200/300?random=$index",
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(title, maxLines: 1),
      subtitle: Text(subTitle, maxLines: 3),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.share),
      ),
    );
  }
}
