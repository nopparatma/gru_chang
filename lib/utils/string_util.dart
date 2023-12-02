class StringUtil {
  static bool isNullOrEmpty(String? s) {
    if (s == null) {
      return true;
    }

    if (s.isEmpty) {
      return true;
    }

    if (s.trim() == '') {
      return true;
    }

    return false;
  }

  static bool isNotEmpty(String s) {
    return !isNullOrEmpty(s);
  }
}
