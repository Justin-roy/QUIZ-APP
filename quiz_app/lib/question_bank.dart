import 'question_setter.dart';

class Question_Bank {
  int _nextQna = 0;
  List<Question> _question = [
    Question('Flutter is Used To Build Android Apps Only', false),
    Question('C++ Used in Android Studio to Builds Apps', true),
    Question('Facebook Was Build in Css Only', false),
    Question('50 + 5*5 + 10 = 100', false),
    Question('Flutter was developed by Google', true),
    Question('15 + 5 + 5/5 = 20', false),
    Question('Year have 12 Months', true),
    Question('1010 is binary number of 10', true),
    Question('1 week is equal to 14 days', false),
    Question('10 - 0 = 0', false),
    Question('Flutter Use C++ Language', false),
  ];
  void generator() {
    if (_nextQna < _question.length - 1)
      ++_nextQna;
    else
      _nextQna = 0;
  }

  int length_of_quiz() {
    return _question.length;
  }

  String getQuestiontxt() {
    return _question[_nextQna].qnsText;
  }

  bool getQuestinAns() {
    return _question[_nextQna].qnaAns;
  }
}
