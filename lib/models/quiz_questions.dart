class QuizQuestion {
  const QuizQuestion(this.text, this.ans);
  final String text;
  final List<String> ans;
  List<String> getShuffled() {
    final newShuffled = List.of(ans);
    newShuffled.shuffle();
    return newShuffled;
  }
}
