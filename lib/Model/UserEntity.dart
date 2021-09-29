class UserEntity {
  int id;
  String name;
  int point;
  String photoUrl;
  int fee;
  String description;
  bool isOnline;
  String email;
  DateTime birdtday;
  GenderStatus gender;
  EducationStatus education;
  WorkStatus work;
  RelationshipStatus relationship;
  UserEntity(
    this.id,
    this.name,
    this.point,
    this.photoUrl,
    this.fee,
    this.description,
    this.isOnline, {
    this.birdtday,
    this.gender,
    this.email,
    this.education,
    this.relationship,
    this.work,
  });
}

enum GenderStatus { KADIN, ERKEK }
enum EducationStatus {YOK, ILKOKUL, ORTAOKUL, LISE, LISANS, YUKSEKLISANS}
enum WorkStatus { CALISIYOR, CALISMIYOR}
enum RelationshipStatus { EVLI, BEKAR }
