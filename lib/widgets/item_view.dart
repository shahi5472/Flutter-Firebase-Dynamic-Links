import 'package:flutter/material.dart';
import 'package:flutter_dynamic_links/utils/utils.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    Key? key,
    required this.id,
    required this.index,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final int id;
  final int index;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://picsum.photos/200/300?random=$index";
    return ListTile(
      onTap: () {},
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(title, maxLines: 1),
      subtitle: Text(subTitle, maxLines: 3),
      trailing: IconButton(
        onPressed: () => Utils.createDynamicLink(
          id: id,
          title: title,
          image: imageUrl,
          route: id.isEven ? "profile" : "details",
        ),
        icon: const Icon(Icons.share),
      ),
    );
  }
}
