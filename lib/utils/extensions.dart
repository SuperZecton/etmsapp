
/// Going to update this soon, regex is a giant pain in the butt

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    )
        .hasMatch(this);
  }
}

extension NRICValidator on String {
  bool isValidNRIC() {
    return RegExp(
            r"([0-9]{3})([a-zA-Z]{1})")
        .hasMatch(this);
  }
}

extension NameValidator on String {
  bool isValidName() {
    return RegExp(
        r"^([a-zA-Z\s]+)\w$")
        .hasMatch(this);
  }
}

extension FrameValidator on String {
  bool isValidFrame() {
    return RegExp(
        r"^([0-9]{3})([A-Z]?)$")
        .hasMatch(this);
  }
}

extension PhoneNumberValidator on String {
  bool isValidPhoneNumber() {
    return RegExp(
        r"^([\+]?)([0-9]+)$")
        .hasMatch(this);
  }
}

extension AttemptsValidator on String {
  bool isValidAttempt() {
    return RegExp(
        r"^([0-9]+)$")
        .hasMatch(this);
  }
}