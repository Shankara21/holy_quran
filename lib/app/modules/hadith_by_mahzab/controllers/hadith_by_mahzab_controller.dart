import 'package:get/get.dart';

class HadithByMahzabController extends GetxController {
  RxList<dynamic> listHadithByMahzab = <dynamic>[].obs;

  void getUrl(int amount, String name, String id) {
    listHadithByMahzab.clear();

    int batchSize = 100;
    int batches = (amount / batchSize).ceil();

    for (int i = 0; i < batches; i++) {
      int start = i * batchSize + 1;
      int end = (i + 1) * batchSize;
      if (end > amount) end = amount;

      String url = '$id?range=$start-$end';

      Map<String, dynamic> data = {
        'id': i + 1,
        'name': name,
        'amount': '$start - $end',
        'url': url,
      };

      listHadithByMahzab.add(data);
    }
  }
}
