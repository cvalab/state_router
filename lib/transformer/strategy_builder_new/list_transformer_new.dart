abstract class ListTransformer<S> {
  List<S> push(S value);
  List<S> pop();
  List<S> get();
}