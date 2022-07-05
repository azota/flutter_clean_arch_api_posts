class TypeCastException implements Exception {
  final String _message;

  TypeCastException(this._message);

  @override
  toString() {
    return "TypeCastException: $_message";
  }
}
