import 'package:math_expressions/math_expressions.dart';


class Calculate {
  var input = '';

  inputPressed(String button){
    input += button;
  }

  equalPressed(){
    input = input.replaceAll('x', '*');
    input = input.replaceAll('%', '/100 *');
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    input = eval.toString();
  }

  cPressed(){
    input = input.substring(0, input.length-1);
  }

  cePressed(){
    input = '';
  }

  plusMinusPressed(){
    input = input.replaceAll('x', '*');
    input = input.replaceAll('%', '/100 *');
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm) * -1;
    input = eval.toString();

  }

}
