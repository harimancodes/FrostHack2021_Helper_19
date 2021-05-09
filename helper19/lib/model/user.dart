class User {
  final String number;
  String _name = '';
  String _emailId = '';

  User(this.number);

  set name(String name) {
    _name = name;
  }
   set emailId(String emailId) {
    _emailId = emailId;
  }

 

}
