class TransformStack extends Iterable{
  final int? maxLenght;

  List<Object>? stack;

  TransformStack({this.maxLenght, this.stack = const []});

  List<Object> add(Object route) {
    if (maxLenght != null && stack!.length == maxLenght) {
      stack!.removeAt(0);
    }
    stack!.add(route);
    return stack!;
  }

  @override
  Iterator get iterator => stack!.iterator;
}
