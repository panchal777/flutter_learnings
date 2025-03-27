import 'package:flutter/cupertino.dart';

import 'local_src.dart' show LocalSrc;

class LocalSrcImpl extends LocalSrc {
  @override
  Stream<int> getStreamData(int maxCount) async* {
    for (int i = 1; i <= maxCount; i++) {
      //Yield each value asynchronously
      await Future.delayed(const Duration(seconds: 1));
      debugPrint("yield $i");
      yield i;
    }
  }
}
