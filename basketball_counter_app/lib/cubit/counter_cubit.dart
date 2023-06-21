import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterBIncrementState());
  int teamAPoints = 0;

  int teamBPoints = 0;
  void TeamIncrement({required String team, required int buttonNumber}) {
    if (team == "A") {
      teamAPoints += buttonNumber;
      emit(CounterAIncrementState());
    } else {
      teamBPoints += buttonNumber;
      emit(CounterBIncrementState());
    }
  }

  void ResetNumber() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(CounterAIncrementState());
  }
}
