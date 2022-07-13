import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  static void createDynamicLink({
    required int id,
    required String title,
    String? image,
    String? route,
  }) async {
    String url = 'https://shahidynamic.page.link';
    String content = 'invite?id=$id&route=$route';

    final params = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/$content'),
      androidParameters: const AndroidParameters(
        packageName: "com.shahi.flutter_dynamic_links",
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.shahi.flutterDynamicLinks",
        appStoreId: "123456789",
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: '',
        imageUrl: Uri.parse('$image'),
        title: title,
      ),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(params);

    print('1 => Dynamic Link => $dynamicLink');
    print('2 => Dynamic Link => ${dynamicLink.shortUrl}');
    print('3 => Dynamic Link => ${dynamicLink.previewLink}');
    print('4 => Dynamic Link => ${dynamicLink.type}');
    print('5 => Dynamic Link => ${dynamicLink.warnings}');

    await Share.share(dynamicLink.shortUrl.toString(), subject: title);

    print('Share link done');
  }
}
