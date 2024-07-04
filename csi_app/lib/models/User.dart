class User{
  String id;
  String name;
  String from;
  String to;
  String lass;
  String duration;
  String status;
  String department;
  String dob;
  String year;
  User({required this.department,required this.year,required this.dob,required this.name,required this.duration,required this.lass,required this.from,required this.id,required this.status,required this.to});

  // Factory constructor to initialize User from a map
  factory User.fromMap(Map<String, String> map) {
    return User(
      department: map['Department']!,
      year: map['year']!,
      dob: map['Dob']!,
      name:map['Name']!,
      id: map['Sap Id']!,
      from: map['From']!,
      to: map['To']!,
      lass: map['class']!,
      duration: map['Duration']!,
      status: map['Status']!,
    );
  }
}