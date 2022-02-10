class Customer {
  String username;
  String password;
  String email;
  String phone;

  Customer(this.username, this.password, this.email, this.phone);

  @override
  String toString() {
    return 'Customer{username: $username, password: $password, email: $email, phone: $phone}';
  }
}