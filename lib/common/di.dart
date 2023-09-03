import 'package:get/get.dart';

import '../network/client.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioClient(), permanent: true);
  }
}
