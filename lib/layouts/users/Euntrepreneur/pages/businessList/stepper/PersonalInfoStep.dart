class PersonalInfoStep {
  late String fullName;
  late String email;
  late String phone;
  late String city;
  late List<String> professionalExperience;

  PersonalInfoStep({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.city,
    required this.professionalExperience,
  });
}




class AddressStep {
  late String street;
  late String city;
  late String state;
  late String zipCode;

  AddressStep({required this.street, required this.city, required this.state, required this.zipCode});
}

class PaymentStep {
  late String cardNumber;
  late String expirationDate;
  late String cvv;

  PaymentStep({required this.cardNumber, required this.expirationDate, required this.cvv});
}

