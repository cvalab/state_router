abstract class ListTransformer<S, R> {
  List<R> push(S value);
  List<R> pop();
  List<R> get();
}