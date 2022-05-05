class Merchant {
  String username;
  String password;
  String email;
  String phone;
  String shopName;
  String description;
  String businessHour;
  String street;
  String city;
  String state;
  int zip;

  Merchant(
      this.username,
      this.password,
      this.email,
      this.phone,
      this.shopName,
      this.description,
      this.businessHour,
      this.street,
      this.city,
      this.state,
      this.zip);

  @override
  String toString() {
    return 'Merchant{username: $username, password: $password, email: $email, phone: $phone, shopName: $shopName, description: $description, '
        'businessHour: $businessHour, street: $street, city: $city, state: $state, zip: ${zip.toString()}}';
  }
}