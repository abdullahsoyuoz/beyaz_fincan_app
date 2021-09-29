import 'package:beyaz_fincan_app/Model/CreditEarnItemEntity.dart';
import 'package:beyaz_fincan_app/Model/CreditPackageEntity.dart';
import 'package:beyaz_fincan_app/Model/FTellerRequestEntity.dart';
import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:flutter/material.dart';

String fakePhotoUrl0 =
    'https://images.unsplash.com/photo-1611175140153-bfd26338ff0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80';
String fakePhotoUrl1 =
    "https://images.unsplash.com/photo-1617175581263-bc0f059cce38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80";
String fakePhotoUrl2 =
    "https://images.unsplash.com/photo-1614289371518-722f2615943d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
String fakePhotoUrl3 =
    "https://images.unsplash.com/photo-1616702451225-6671e7e831f8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80";
String fakePhotoUrl4 =
    "https://images.unsplash.com/photo-1610902188765-fcdeff499d75?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80";
String fakePhotoUrl5 =
    "https://images.unsplash.com/photo-1616776005756-4dca36124bf9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80";
String fakePhotoUrl6 =
    "https://images.unsplash.com/photo-1625201925673-1054ca34b3f4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80";

String burcKocDescriptionSample =
    'İletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.';
String burcBogaDescriptionSample =
    'Yatırımlar ve kazançlar konusunda bazı beklentiler içinde olacaksınız. Bütçenizi zorlayacak zevklerinizden kaçınmalı, masraflarınızı asgariye indirmelisiniz. Kişisel egolarınızın zararlı olabileceğini sizde fark ediyorsunuz.';
String burcIkizlerDescriptionSample =
    'Arkadaşlarınız arasında farklı gelen kişilerle duygusal bağlarınızı güçlendirme adına başarılı çalışmalar içindesiniz. Onlara yardımcı olmak isteyecek ve değişik fikirler vereceksiniz. İletişim sorunu yaşamaktan kaçınmalısınız.';
String burcYengecDescriptionSample =
    'Araştırmacı bir ruhla hareket ederek, çevrenizi sıkı bir şekilde irdeleyeceksiniz. Sistemli yapınızı daha da belirgin bir şekilde vurgulayacak ve etrafınızda aniden gelişecek olayları yeniden düzenlemek isteyeceksiniz.';
String burcAslanDescriptionSample =
    'Siz aşka  her zaman çok önem veren bir kişi olarak  her zamankinden çok daha fazla aşk duygularınızın yoğun olacağını bilmelisiniz. Partiden partiye koşarken, katılacağınız toplantılarda bir çok kişinin dikkatini çekeceksiniz.';
String burcBasakDescriptionSample =
    'Bugün iletişim konusunda başarılı bir tablo çizmenize rağmen, çevresel koşullar yüzünden isteklerinizin gerçekleşmesi uzayabilir.  Çevrenize ödün vermeden başarınızı yükseltmenin kolay olmadığını, siz de fark ediyorsunuz';
String burcTeraziDescriptionSample =
    'İlişkilerinizdeki dengeyi bulabilmeniz oldukça zorlaşıyor. Düşüncelerinizi karşı tarafa kabul ettirme konusunda savaş verebilirsiniz. Bildiğiniz konularda taviz vermek istemediğiniz için, sorunlar bir çığ gibi büyüyecektir.';
String burcAkrepDescriptionSample =
    'Bugün, bulunduğunuz grupları, etkileyici konuşmalarınızla ikna edeceksiniz.. Eğer, bekarsanız; işte size büyük bir fırsat. Tesadüfen tanışacağınız bir kişi ile şimdiden kolları sıvayın ve yeni duygularınızın keyfini çıkarın.';
String burcYayDescriptionSample =
    'Aile bireylerinin bazı konulardaki isteklerinin çıtaları yüksek olabilir. Onların duygusal problemlerine de çare bulmak size düşebilir. Arabuluculuk size yakışacak. İletişim konusunda olumlu bir görüntü veriyorsunuz.';
String burcOglakDescriptionSample =
    'İşinizde yüksek bir performans yakalamak için, engeller karşısında olumsuz bir tutum izleyebilirsiniz. Gücünüzü karşı tarafa hissettirme konusunda baskıcı davranacaksınız. Bugün kalabalık bir ortamda bulunabilirsiniz.';
String burcKovaDescriptionSample =
    'Sezgilerinizin yoğun olduğu bir gün. Değişken bir ruh hali içindesiniz. İmajınızla ilgili değişimler içinde olmanıza rağmen, güçlü kişiliğiniz ön planda. Yaşamınızda tüm olaylara farklı bir şekilde yaklaşıyorsunuz.';
String burcBalikDescriptionSample =
    'Bugün Mars, kombinasyon burcunuz Başak’ta ilerlemekte ve özgür düşünceler içinde hareket etmenize neden olmaktadır. Aşk yaşantınızda eğlenceli ve ilgi çekici olaylar gündeme gelecek. Sosyal aktiviteleriniz artacak.';

var faeLoginUser = UserEntity(
  9,
  "Halime Bekaroğlu",
  1789,
  fakePhotoUrl0,
  0,
  "",
  true,
  birdtday: DateTime(1973, 3, 29),
  email: 'halimebekaroglu@test.com',
  education: EducationStatus.LISANS,
  gender: GenderStatus.KADIN,
  relationship: RelationshipStatus.EVLI,
  work: WorkStatus.CALISIYOR,
);

List<UserEntity> fakeFTellerList = [
  new UserEntity(0, "Aleyna Çalışkan", 1789, fakePhotoUrl1, 90,
      "Geleceğe dair ne varsa", true),
  new UserEntity(1, "Hakan Altun", 1789, fakePhotoUrl2, 111,
      "Geleceğe dair ne varsa", false),
  new UserEntity(2, "Sinasi Taşdeviren", 1789, fakePhotoUrl3, 232,
      "Geleceğe dair ne varsa", true),
  new UserEntity(3, "Hanzade Çalışkan", 1789, fakePhotoUrl4, 231,
      "Geleceğe dair ne varsa", true),
  new UserEntity(4, "Sibel Can", 1789, fakePhotoUrl5, 523,
      "Geleceğe dair ne varsa", false),
  new UserEntity(5, "Kaşıkçı Hanım", 1789, fakePhotoUrl6, 765,
      "Geleceğe dair ne varsa", true),
  new UserEntity(1, "Aleyna Çalışkan", 1789, fakePhotoUrl1, 90,
      "Geleceğe dair ne varsa", true),
  new UserEntity(2, "Hakan Altun", 1789, fakePhotoUrl2, 111,
      "Geleceğe dair ne varsa", false),
  new UserEntity(3, "Sinasi Taşdeviren", 1789, fakePhotoUrl3, 232,
      "Geleceğe dair ne varsa", true),
  new UserEntity(4, "Hanzade Çalışkan", 1789, fakePhotoUrl4, 231,
      "Geleceğe dair ne varsa", true),
  new UserEntity(5, "Sibel Can", 1789, fakePhotoUrl5, 523,
      "Geleceğe dair ne varsa", false),
  new UserEntity(6, "Kaşıkçı Hanım", 1789, fakePhotoUrl6, 765,
      "Geleceğe dair ne varsa", true),
];

List<CreditPkgEntity> creditPkgList = [
  new CreditPkgEntity(0, 'Bronz', 10, 20, appAssetsPathCredit),
  new CreditPkgEntity(1, 'Gümüş', 20, 30, appAssetsPathCredit),
  new CreditPkgEntity(2, 'Altın', 40, 55, appAssetsPathCredit),
  new CreditPkgEntity(3, 'Elmas', 100, 80, appAssetsPathCredit),
  new CreditPkgEntity(4, 'Pırlanta', 200, 120, appAssetsPathCredit),
];

List<CreditEarnItemEntity> creditEarnOptionList = [
  new CreditEarnItemEntity(
    id: 0,
    title: 'İZLE KAZAN',
    subTitle: null,
    iconPath: appAssetsPathCinema,
    gradientColorStart: Color.fromARGB(255, 252, 123, 72),
    gradientColorEnd: Color.fromARGB(255, 252, 53, 125),
  ),
  new CreditEarnItemEntity(
    id: 1,
    title: 'TAKİP ET KAZAN',
    subTitle: 'instagram',
    iconPath: appAssetsPathInstagram,
    gradientColorStart: Color.fromARGB(255, 62, 191, 225),
    gradientColorEnd: Color.fromARGB(255, 16, 119, 165),
  ),
];

List<FTellerRequestEntity> fTellerRequestList = [
  new FTellerRequestEntity(
    id: 0,
    fortunaTeller: fakeFTellerList[0],
    status: 'Falcı tarafından inceleniyor',
    fee: 90,
    requestDate: DateTime(2021, 3, 07),
  ),
  new FTellerRequestEntity(
    id: 1,
    fortunaTeller: fakeFTellerList[1],
    status: 'Falcı tarafından inceleniyor',
    fee: 3,
    requestDate: DateTime(2021, 5, 07),
  ),
  new FTellerRequestEntity(
    id: 2,
    fortunaTeller: fakeFTellerList[2],
    status: 'Falcı tarafından inceleniyor',
    fee: 5,
    requestDate: DateTime(2021, 6, 07),
  ),
  new FTellerRequestEntity(
    id: 3,
    fortunaTeller: fakeFTellerList[3],
    status: 'Falcı tarafından inceleniyor',
    fee: 7,
    requestDate: DateTime(2021, 9, 07),
  ),
  new FTellerRequestEntity(
    id: 4,
    fortunaTeller: fakeFTellerList[4],
    status: 'Falcı tarafından inceleniyor',
    fee: 9,
    requestDate: DateTime(2021, 1, 07),
  ),
  new FTellerRequestEntity(
    id: 5,
    fortunaTeller: fakeFTellerList[5],
    status: 'Falcı tarafından inceleniyor',
    fee: 15,
    requestDate: DateTime(2021, 2, 07),
  ),
  new FTellerRequestEntity(
    id: 6,
    fortunaTeller: fakeFTellerList[6],
    status: 'Falcı tarafından inceleniyor',
    fee: 35,
    requestDate: DateTime(2021, 11, 07),
  ),
  new FTellerRequestEntity(
    id: 7,
    fortunaTeller: fakeFTellerList[7],
    status: 'Falcı tarafından inceleniyor',
    fee: 25,
    requestDate: DateTime(2021, 0, 07),
  ),
];

String requestDetailContentText =
    'Sevgili Halime;\n\nİletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.\n\nİletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.İletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.\n\nİletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.İletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.İletişiminizin ön planda olabileceği bir gündesiniz. Yakın çevreniz ile girdiğiniz diyaloglarda fikirleriniz ve bunları sunma tarzınız etkileyeceği sonuçlar getirebilir. Konuşmak istediğiniz konular varsa bu fırsatı değerlendirmelisiniz.';
