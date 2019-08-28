import '../actions/index.dart';
import '../states/index.dart';

CounterState counterReducer(CounterState previousState, dynamic action) {
  if (action is SignupAction) {
    return CounterState(previousState.count + action.email);
  } else if (action is DecrementAction) {
    return CounterState(previousState.count - action.count);
  } else {
    return previousState;
  }
}
