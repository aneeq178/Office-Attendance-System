
class Validators
{
  validateEmail(String e) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (e.isEmpty) {
      return "Please provide your email";
    } else if (!emailRegExp.hasMatch(e)) {
      return 'Enter a correct email';
    }

    return null;
  }

  validatename(String e) {
    if (e.isEmpty) {
      return "Please enter name";
    }
    return null;
  }

  validatephone(String e) {
    if (e.isEmpty) {
      return "Please enter your phone number";
    }
    return null;
  }

  validatePassword(String? e) {
    if (e == null) {
      return "Please provide your password";
    }
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be more than 6 characters";
    }
    return null;
  }
}