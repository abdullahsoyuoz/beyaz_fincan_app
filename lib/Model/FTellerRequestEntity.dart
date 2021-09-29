import 'package:beyaz_fincan_app/Model/UserEntity.dart';

class FTellerRequestEntity {
  int id;
  UserEntity fortunaTeller;
  DateTime requestDate;
  String status;
  int fee;
  FTellerRequestEntity({
    this.id,
    this.fortunaTeller,
    this.requestDate,
    this.fee,
    this.status,
  });
}
