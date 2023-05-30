class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String>get shuffleadAnswers{
    final shuffleadList=List.of(answers);
    shuffleadList.shuffle();
    return shuffleadList;
  }
}
