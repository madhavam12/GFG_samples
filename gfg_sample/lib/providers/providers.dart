import 'package:flutter_riverpod/flutter_riverpod.dart';

//Instead of String you can use other data types as well, you can also use custom data types.
final userNameProvider = StateProvider<String>((ref) {
  return "SomeName"; //we're returning a empty string here, we can change this value later.
});

final futureClass = Provider((ref) => FutureClass());

final streamProvider = StreamProvider<int>((ref) {
  return Stream.fromIterable([105, 50]);
  //in production this could be a stream of documents from Firestore
});

final response = FutureProvider<int>((ref) async {
  final client = ref.read(futureClass);
  return client.getData('some text as a parameter');
});

class FutureClass {
  //in production, the below method could be any network call
  Future<int> getData(String para) async {
    await Future.delayed(Duration(seconds: 5));
    return 25;
  }
}
