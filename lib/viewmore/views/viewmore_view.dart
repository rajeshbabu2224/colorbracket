import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../routes/app_pages.dart';
import '../controllers/viewmore_controller.dart';

class ViewMoreView extends GetView<ViewMoreController> {
  const ViewMoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: controller.link,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
