import '../stack_transformer.dart';

sealed class AppState with ChildState {
}

class HomeState extends AppState {
  final String name;

  final List<Object> children;

  HomeState({this.name = '', this.children = const []});
}

class AboutState extends AppState {
  final String name;

  AboutState(this.name);
}

class SettingState extends AppState {
}

mixin ChildState {
  List<Object> children = [];

  List<Object> addChild(Object child) {
    children.add(child);
    return children;
  }

  List<Object> removeChild(Object child) {
    children.remove(child);
    return children;
  }

  List<Object> removeAllChildren() {
    children.clear();
    return children;
  }

  List<Object> replaceChild(Object oldChild, Object newChild) {
    final index = children.indexOf(oldChild);
    children[index] = newChild;
    return children;
  }

  List<Object> getChildren() {
    return children;
  }
}

void main() {
  final stack = StackTransformer();
  //final about= AboutState('About')..addChild(child);
  stack.push(HomeState(name: 'Home'));
  stack.push(AboutState('About'));
  stack.push(SettingState());
  print(stack.stack);
}
