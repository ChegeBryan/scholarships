class Application {
  String firstName;
  String lastName;
  String mobile;
  String country;
  String city;
  String schoolName;
  String degree;
  String coverLetter;
  String start;
  String to;
  String postalCode;
  String birthCertificate;
  String nationalId;
  bool isApproved;
  bool isRejected;

  Application({
    this.firstName,
    this.lastName,
    this.mobile,
    this.country,
    this.city,
    this.schoolName,
    this.degree,
    this.coverLetter,
    this.start,
    this.to,
    this.postalCode,
    this.birthCertificate,
    this.nationalId,
    this.isApproved = true,
    this.isRejected = true,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'mobile': mobile,
        'country': country,
        'city': city,
        'school_name': schoolName,
        'degree': degree,
        'cover_letter': coverLetter,
        'start': start,
        'to': to,
        'postal_code': postalCode,
        'birth_certificate': birthCertificate,
        'national_id': nationalId,
        'is_approved': isApproved,
        'is_rejected': isRejected,
      };
}
