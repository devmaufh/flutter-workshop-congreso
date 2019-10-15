class Validaciones {
  static bool isEmpty(String text){
    return text.length==0;
  }
  static bool validateLength60(String text){
    return text.length>60;
  }
  static bool validateNumber(String text){
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text) || text.length!=10;
    //return text.length>10;
  }
  static bool validateEmail(String text){
    return !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
  }
}