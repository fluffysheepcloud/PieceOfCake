class Customer {
  int? id;
  String username;
  String nickName;
  String password;
  String email;
  String phone;

  Customer(this.id, this.username, this.nickName,this.password, this.email, this.phone);

  @override
  String toString() {
    return 'Customer{username: $username, nickName: $nickName, password: $password, email: $email, phone: $phone}';
  }
}