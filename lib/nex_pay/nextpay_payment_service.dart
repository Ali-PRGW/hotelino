import 'package:url_launcher/url_launcher.dart';

class NextPayPaymentService {
  static const String paymentUrl = 'https://hotelino.ir.page';

  static Future<void> openPaymentPage() async {
    final Uri uri = Uri.parse(paymentUrl);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $paymentUrl');
    }
  }
}
