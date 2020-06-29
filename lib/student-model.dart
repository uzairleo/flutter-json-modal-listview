class Student {
  String stdId;
  String stdName;
  int stdScore;
  Student({
    this.stdId,
    this.stdName,
    this.stdScore,
  });
  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
      stdId: parsedJson['id'],
      stdName: parsedJson['name'],
      stdScore: parsedJson['score'],
    );
  }
}
