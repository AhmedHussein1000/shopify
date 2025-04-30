import 'package:flutter_bloc/flutter_bloc.dart';

class ShowFAQAnswerCubit extends Cubit<List<bool>> {
  ShowFAQAnswerCubit(int fAQsLength) : super(List.filled(fAQsLength, false));

  void showAndHideAnswer(int index) {
    List<bool> currentState = List<bool>.from(state);
    currentState[index] = !currentState[index];
    emit(currentState);
  }
}
