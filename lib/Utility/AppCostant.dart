import 'package:beyaz_fincan_app/Model/FTellerSendItem.dart';
import 'package:beyaz_fincan_app/Model/FortuneTellerEntity.dart';
import 'package:beyaz_fincan_app/Model/HoroscopeEntity.dart';
import 'package:beyaz_fincan_app/Model/RequestBottomMenuItemEntity.dart';
import 'package:beyaz_fincan_app/Model/TransactionEntityies.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';

class AppCostant {}

bool tarotCardFlipActive = true;
int selectedTarotCardCount = 0;

List<String> genderDropdownItems = [
  'Kadın',
  'Erkek',
];

List<String> workStatusDropDownItems = [
  'Çalışır durumda',
  'İşsiz',
];

List<String> relationshipStatusDropdownItems = [
  'Evli',
  'Bekar',
];

List<String> educationStatusDropdownItems = [
  'Yok',
  'İlkokul',
  'Ortaokul',
  'Lise',
  'Lisans',
  'Yüksek Lisans'
];

List<String> forWhomDropdownItems = [
  'EŞİM İÇİN',
  'BENİM İÇİN',
];

List<String> requestTypeDropdownItems = [
  'GENEL',
  'AŞK',
  'KARİYER',
  'ŞANS OYUNLARI',
];

List<FortuneTellEntity> fortuneTellItemList = [
  new FortuneTellEntity(0, 'Kahve Falı', appAssetsFalKahve),
  new FortuneTellEntity(1, 'Tarot Falı', appAssetsFalTarot),
  new FortuneTellEntity(2, 'El Falı', appAssetsFalEl),
  new FortuneTellEntity(3, 'Yüz Falı', appAssetsFalYuz),
  new FortuneTellEntity(4, 'Rüya Yorumları', appAssetsFalRuyaYorum),
  new FortuneTellEntity(5, 'Günlük Burçlar', appAssetsFalBurc),
];

List<CreditTransactionsEntity> creditTList = [
  new CreditTransactionsEntity(0, 'Kredi Satın Al'),
  new CreditTransactionsEntity(1, 'Kredi Kazan'),
  new CreditTransactionsEntity(2, 'Reklamları Kaldır'),
];

List<OtherTransactionsEntity> otherTList = [
  new OtherTransactionsEntity(0, 'Bize Yazın'),
  new OtherTransactionsEntity(1, 'Profil Bilgiler'),
  new OtherTransactionsEntity(2, 'Ayarlar'),
];

List<AppTransactionsEntity> appTList = [
  new AppTransactionsEntity(0, 'Hakkında'),
  new AppTransactionsEntity(1, 'Çıkış Yap'),
];

List<FTSendItem> sendItemKahve = [
  new FTSendItem(0, 'FİNCAN'),
  new FTSendItem(1, 'FİNCAN'),
  new FTSendItem(2, 'TABAK'),
];
List<FTSendItem> sendItemTarot = [
  new FTSendItem(0, 'GEÇMİŞ'),
  new FTSendItem(1, 'ŞİMDİ'),
  new FTSendItem(2, 'GELECEK'),
];
List<FTSendItem> sendItemEl = [
  new FTSendItem(0, 'SOL EL'),
  new FTSendItem(1, 'SAĞ EL'),
];

List<FTSendItem> sendItemYuz = [
  new FTSendItem(0, 'YÜZ FOTOĞRAFI'),
];

List<RequestBottomMenuItemEntity> requestMenuItemList = [
  new RequestBottomMenuItemEntity(
    id: 0,
    title: 'Kahve Falı',
    iconPath: appAssetsPathRBMenuKahve,
  ),
  new RequestBottomMenuItemEntity(
    id: 1,
    title: 'Tarot Falı',
    iconPath: appAssetsPathRBMenuTarot,
  ),
  new RequestBottomMenuItemEntity(
    id: 2,
    title: 'El Falı',
    iconPath: appAssetsPathRBMenuEl,
  ),
  new RequestBottomMenuItemEntity(
    id: 3,
    title: 'Yüz Falı',
    iconPath: appAssetsPathRBMenuYuz,
  ),
];

List<HoroscopeEntity> horoscopeList = [
  new HoroscopeEntity(
    id: 0,
    title: 'KOÇ',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Yeter ki hevesim kırılmasın!',
    iconPath: appAssetsBurcKoc,
    description: burcKocDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 1,
    title: 'BOĞA',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Venüs',
    motto: 'Bana para gösterin!',
    iconPath: appAssetsBurcBoga,
    description: burcBogaDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 2,
    title: 'İKİZLER',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Dans iki kişiyle yapılır!',
    iconPath: appAssetsBurcIkizler,
    description: burcIkizlerDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 3,
    title: 'YENGEÇ',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Ev, kalbin olduğu yerdir!',
    iconPath: appAssetsBurcYengec,
    description: burcYengecDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 4,
    title: 'ASLAN',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Hiçbir iş gösteri yapılmaksızın yapılamaz!',
    iconPath: appAssetsBurcAslan,
    description: burcAslanDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 5,
    title: 'BAŞAK',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Dikiş bir kere yapılmaz!',
    iconPath: appAssetsBurcBasak,
    description: burcBasakDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 6,
    title: 'TERAZİ',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Güzellik bakınca fark edilmelidir!',
    iconPath: appAssetsBurcTerazi,
    description: burcTeraziDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 7,
    title: 'AKREP',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Evet, haydi bebeğim!',
    iconPath: appAssetsBurcAkrep,
    description: burcAkrepDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 8,
    title: 'YAY',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Benimle düello etmeyin!',
    iconPath: appAssetsBurcYay,
    description: burcYayDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 9,
    title: 'OĞLAK',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Amaçsız yaşamam!',
    iconPath: appAssetsBurcOglak,
    description: burcOglakDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 10,
    title: 'KOVA',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Dünyanın dışında düşün!',
    iconPath: appAssetsBurcKova,
    description: burcKovaDescriptionSample,
  ),
  new HoroscopeEntity(
    id: 11,
    title: 'BALIK',
    day: '29 ŞUBAT 2021',
    element: 'Ateş',
    planet: 'Mars',
    motto: 'Savaş değil aşk yapın!',
    iconPath: appAssetsBurcBalik,
    description: burcBalikDescriptionSample,
  ),
];
