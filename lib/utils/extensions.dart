// ignore_for_file: avoid_print

extension ExceptionLogger on Object {
  void logError() {
    print(("-__-EXCEPTION OCCURED-__-"));
    print(toString());
    print(("----_____----"));
  }
}
