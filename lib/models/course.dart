class Course {
  String title;
  String instructor;
  String imageUrl;
  int numOfRatings;
  double _rating;

  Course({
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.numOfRatings,
    required double rating,
  }) : _rating = rating;

  double get rating => _rating;
}
