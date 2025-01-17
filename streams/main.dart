void main() async {
  Stream<int> intStream = getIntStream(Duration(milliseconds: 200));

  // not equals result in stream with distinct
  // intStream.distinct().listen(print);

  // get before and after elements with. Sum prev + element when i <= 20
  final sum = await intStream.reduce((previous, element) => previous + element);
  print(sum);

  //simple operators
  // intStream.map((value) => value * 2).listen(print);
  // intStream.listen((value) {
  //   print(value);
  // });
}

Stream<int> getIntStream(Duration duration) async* {
  int i = 0;
  while (i <= 20) {
    i++;
    await Future.delayed(duration);
    yield i;
  }
}
