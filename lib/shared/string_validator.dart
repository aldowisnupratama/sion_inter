extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPhoneNumber() {
    const pattern =
        r'^(\+62|62)?[\s-]?0?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$';
    final regExp = RegExp(pattern);

    if (regExp.hasMatch(this)) {
      return true;
    }
    return false;
  }

  bool isValidURL() {
    bool _validURL = Uri.parse(this).isAbsolute;
    return _validURL;
  }

  bool isValidNIK() {
    return this.length == 16;
  }
}
