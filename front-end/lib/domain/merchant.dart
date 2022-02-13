class Merchant {
  String username;
  String shopname;
  String password;
  String email;
  String phone;
  String description;
  String businessHour;
  String street;
  String city;
  String state;
  int zip;

  Merchant(
      this.username,
      this.shopname,
      this.password,
      this.email,
      this.phone,
      this.description,
      this.businessHour,
      this.street,
      this.city,
      this.state,
      this.zip);

  @override
  String toString() {
    return 'Customer{username: $username, password: $password, email: $email, phone: $phone}';
  }
}