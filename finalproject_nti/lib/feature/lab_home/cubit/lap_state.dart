
sealed class LapState {}

class LapInitialState extends LapState {}

class LapLoadingState extends LapState {}

class LapSuccessState extends LapState {
  final labs;

  LapSuccessState({required this.labs});
}

class LapFailedState extends LapState {}
