import 'show_toast.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunction(String? url) async {
  if (url.isNullOrEmpty()) {
    customToast('Invalid or empty URL', ToastStates.error);
    return;
  }

  if (!url!.startsWith('http://') && !url.startsWith('https://')) {
    url = 'https://$url';
  }

  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri,mode: LaunchMode.externalApplication);
  } else {
    customToast('Couldn\'t launch $url', ToastStates.error);
  }
}
