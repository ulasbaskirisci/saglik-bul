import '../models/localized_string.dart';
import 'mock_provider_seed.dart';

const _hc = LocalizedString(en: 'Healthcare', tr: 'Sağlık');
const _cardio = LocalizedString(en: 'Cardiology', tr: 'Kardiyoloji');
const _dent = LocalizedString(en: 'Dentistry', tr: 'Diş Hekimliği');
const _ped = LocalizedString(en: 'Pediatrics', tr: 'Çocuk Sağlığı');
const _derm = LocalizedString(en: 'Dermatology', tr: 'Dermatoloji');
const _ortho = LocalizedString(en: 'Orthopedics', tr: 'Ortopedi');
const _gyn = LocalizedString(en: 'Gynecology', tr: 'Kadın Hastalıkları');
const _psych = LocalizedString(en: 'Psychiatry', tr: 'Psikiyatri');
const _physio = LocalizedString(en: 'Physical Therapy', tr: 'Fizik Tedavi');
const _gp = LocalizedString(en: 'General Practice', tr: 'Aile Hekimliği');
const _eye = LocalizedString(en: 'Ophthalmology', tr: 'Göz Hastalıkları');
const _ent = LocalizedString(en: 'ENT', tr: 'Kulak Burun Boğaz');
const _tech = LocalizedString(en: 'Technology', tr: 'Teknoloji');
const _legal = LocalizedString(en: 'Legal', tr: 'Hukuk');

const _tr = LocalizedString(en: 'Turkey', tr: 'Türkiye');
const _de = LocalizedString(en: 'Germany', tr: 'Almanya');
const _uk = LocalizedString(en: 'United Kingdom', tr: 'Birleşik Krallık');
const _fr = LocalizedString(en: 'France', tr: 'Fransa');
const _us = LocalizedString(en: 'United States', tr: 'ABD');
const _nl = LocalizedString(en: 'Netherlands', tr: 'Hollanda');
const _es = LocalizedString(en: 'Spain', tr: 'İspanya');
const _it = LocalizedString(en: 'Italy', tr: 'İtalya');
const _at = LocalizedString(en: 'Austria', tr: 'Avusturya');

/// 30 bilingual provider records for the case study mock API.
const List<MockProviderSeed> mockProviderSeeds = [
  MockProviderSeed(
    id: '1',
    name: LocalizedString(
      en: 'Ankara Memorial Hospital',
      tr: 'Ankara Memorial Hastanesi',
    ),
    category: _hc,
    country: _tr,
    city: LocalizedString(en: 'Ankara', tr: 'Ankara'),
    rating: 4.8,
    phone: '+90 312 555 0101',
    email: 'info@ankaramemorial.example',
    description: LocalizedString(
      en: 'Multi-specialty hospital with 24/7 emergency and imaging services.',
      tr: '7/24 acil servis ve görüntüleme hizmetleri sunan çok branşlı hastane.',
    ),
  ),
  MockProviderSeed(
    id: '2',
    name: LocalizedString(
      en: 'Istanbul Heart Center',
      tr: 'İstanbul Kalp Merkezi',
    ),
    category: _cardio,
    country: _tr,
    city: LocalizedString(en: 'Istanbul', tr: 'İstanbul'),
    rating: 4.9,
    phone: '+90 212 555 0202',
    email: 'randevu@istanbulheart.example',
    description: LocalizedString(
      en: 'Interventional cardiology, check-ups, and cardiac rehabilitation.',
      tr: 'Girişimsel kardiyoloji, check-up ve kalp rehabilitasyonu.',
    ),
  ),
  MockProviderSeed(
    id: '3',
    name: LocalizedString(
      en: 'Izmir Smile Dental Clinic',
      tr: 'İzmir Smile Diş Kliniği',
    ),
    category: _dent,
    country: _tr,
    city: LocalizedString(en: 'Izmir', tr: 'İzmir'),
    rating: 4.6,
    phone: '+90 232 555 0303',
    description: LocalizedString(
      en: 'Implants, orthodontics, and cosmetic dentistry under one roof.',
      tr: 'İmplant, ortodonti ve estetik diş hekimliği tek çatı altında.',
    ),
  ),
  MockProviderSeed(
    id: '4',
    name: LocalizedString(
      en: 'Antalya Kids Health',
      tr: 'Antalya Çocuk Sağlığı',
    ),
    category: _ped,
    country: _tr,
    city: LocalizedString(en: 'Antalya', tr: 'Antalya'),
    rating: 4.7,
    phone: '+90 242 555 0404',
    email: 'hello@antalyakids.example',
    description: LocalizedString(
      en: 'Pediatric check-ups, vaccination schedules, and parent counseling.',
      tr: 'Çocuk muayenesi, aşı takibi ve ebeveyn danışmanlığı.',
    ),
  ),
  MockProviderSeed(
    id: '5',
    name: LocalizedString(
      en: 'Bursa Skin & Aesthetic Clinic',
      tr: 'Bursa Cilt ve Estetik Kliniği',
    ),
    category: _derm,
    country: _tr,
    city: LocalizedString(en: 'Bursa', tr: 'Bursa'),
    rating: 4.5,
    email: 'contact@bursaderm.example',
    description: LocalizedString(
      en: 'Medical dermatology, acne treatment, and laser procedures.',
      tr: 'Medikal dermatoloji, akne tedavisi ve lazer uygulamaları.',
    ),
  ),
  MockProviderSeed(
    id: '6',
    name: LocalizedString(
      en: 'Berlin Ortho Sports Clinic',
      tr: 'Berlin Ortopedi Spor Kliniği',
    ),
    category: _ortho,
    country: _de,
    city: LocalizedString(en: 'Berlin', tr: 'Berlin'),
    rating: 4.8,
    phone: '+49 30 555 0606',
    email: 'care@berlinortho.example',
    description: LocalizedString(
      en: 'Sports injuries, joint replacement, and physiotherapy programs.',
      tr: 'Spor yaralanmaları, eklem protezi ve fizik tedavi programları.',
    ),
  ),
  MockProviderSeed(
    id: '7',
    name: LocalizedString(
      en: 'Munich Women\'s Wellness',
      tr: 'Münih Kadın Sağlığı Merkezi',
    ),
    category: _gyn,
    country: _de,
    city: LocalizedString(en: 'Munich', tr: 'Münih'),
    rating: 4.7,
    phone: '+49 89 555 0707',
    description: LocalizedString(
      en: 'OB-GYN exams, prenatal care, and minimally invasive surgery.',
      tr: 'Kadın doğum muayenesi, gebelik takibi ve minimal invaziv cerrahi.',
    ),
  ),
  MockProviderSeed(
    id: '8',
    name: LocalizedString(
      en: 'Hamburg Mind Care Center',
      tr: 'Hamburg Ruh Sağlığı Merkezi',
    ),
    category: _psych,
    country: _de,
    city: LocalizedString(en: 'Hamburg', tr: 'Hamburg'),
    rating: 4.4,
    phone: '+49 40 555 0808',
    email: 'support@hamburgmind.example',
    description: LocalizedString(
      en: 'Psychotherapy, anxiety management, and corporate wellness.',
      tr: 'Psikoterapi, anksiyete yönetimi ve kurumsal wellness.',
    ),
  ),
  MockProviderSeed(
    id: '9',
    name: LocalizedString(
      en: 'London Bridge GP Practice',
      tr: 'Londra Bridge Aile Hekimliği',
    ),
    category: _gp,
    country: _uk,
    city: LocalizedString(en: 'London', tr: 'Londra'),
    rating: 4.6,
    phone: '+44 20 5555 0909',
    email: 'reception@londonbridgegp.example',
    description: LocalizedString(
      en: 'Same-day appointments, chronic disease follow-up, and referrals.',
      tr: 'Aynı gün randevu, kronik hastalık takibi ve sevk hizmetleri.',
    ),
  ),
  MockProviderSeed(
    id: '10',
    name: LocalizedString(
      en: 'Manchester Eye Institute',
      tr: 'Manchester Göz Enstitüsü',
    ),
    category: _eye,
    country: _uk,
    city: LocalizedString(en: 'Manchester', tr: 'Manchester'),
    rating: 4.5,
    email: 'appointments@manchestereye.example',
    description: LocalizedString(
      en: 'Cataract surgery, vision correction, and pediatric ophthalmology.',
      tr: 'Katarakt cerrahisi, görme düzeltme ve çocuk göz hastalıkları.',
    ),
  ),
  MockProviderSeed(
    id: '11',
    name: LocalizedString(
      en: 'Paris ENT Specialists',
      tr: 'Paris KBB Uzmanları',
    ),
    category: _ent,
    country: _fr,
    city: LocalizedString(en: 'Paris', tr: 'Paris'),
    rating: 4.7,
    phone: '+33 1 5555 1010',
    description: LocalizedString(
      en: 'Hearing tests, sinus treatment, and voice therapy.',
      tr: 'İşitme testleri, sinüs tedavisi ve ses terapisi.',
    ),
  ),
  MockProviderSeed(
    id: '12',
    name: LocalizedString(
      en: 'Lyon Rehab & Motion',
      tr: 'Lyon Rehabilitasyon Merkezi',
    ),
    category: _physio,
    country: _fr,
    city: LocalizedString(en: 'Lyon', tr: 'Lyon'),
    rating: 4.6,
    email: 'info@lyonrehab.example',
    description: LocalizedString(
      en: 'Post-surgery rehab, manual therapy, and occupational health.',
      tr: 'Ameliyat sonrası rehab, manuel terapi ve iş sağlığı.',
    ),
  ),
  MockProviderSeed(
    id: '13',
    name: LocalizedString(
      en: 'New York Integrative Clinic',
      tr: 'New York İntegratif Klinik',
    ),
    category: _hc,
    country: _us,
    city: LocalizedString(en: 'New York', tr: 'New York'),
    rating: 4.8,
    phone: '+1 212 555 1111',
    email: 'care@nyintegrative.example',
    description: LocalizedString(
      en: 'Holistic primary care blending nutrition and mental wellness.',
      tr: 'Beslenme ve ruh sağlığını birleştiren bütüncül birinci basamak.',
    ),
  ),
  MockProviderSeed(
    id: '14',
    name: LocalizedString(
      en: 'San Francisco Digital Health Lab',
      tr: 'San Francisco Dijital Sağlık Laboratuvarı',
    ),
    category: _tech,
    country: _us,
    city: LocalizedString(en: 'San Francisco', tr: 'San Francisco'),
    rating: 4.7,
    email: 'hello@sfdigitalhealth.example',
    description: LocalizedString(
      en: 'Telehealth platforms and FHIR integrations for clinics.',
      tr: 'Klinikler için tele sağlık platformları ve FHIR entegrasyonları.',
    ),
  ),
  MockProviderSeed(
    id: '15',
    name: LocalizedString(
      en: 'Chicago Family Legal Clinic',
      tr: 'Chicago Aile Hukuku Kliniği',
    ),
    category: _legal,
    country: _us,
    city: LocalizedString(en: 'Chicago', tr: 'Chicago'),
    rating: 4.2,
    phone: '+1 312 555 1212',
    description: LocalizedString(
      en: 'Family law consultations adjacent to hospital partnerships.',
      tr: 'Hastane iş birlikleri yanında aile hukuku danışmanlığı.',
    ),
  ),
  MockProviderSeed(
    id: '16',
    name: LocalizedString(
      en: 'Amsterdam Primary Care Network',
      tr: 'Amsterdam Birinci Basamak Ağı',
    ),
    category: _gp,
    country: _nl,
    city: LocalizedString(en: 'Amsterdam', tr: 'Amsterdam'),
    rating: 4.6,
    phone: '+31 20 555 1313',
    email: 'info@amsterdamcare.example',
    description: LocalizedString(
      en: 'Network of GPs with shared electronic health records.',
      tr: 'Ortak elektronik sağlık kaydı kullanan aile hekimi ağı.',
    ),
  ),
  MockProviderSeed(
    id: '17',
    name: LocalizedString(
      en: 'Rotterdam Harbor Medical',
      tr: 'Rotterdam Liman Sağlık',
    ),
    category: _hc,
    country: _nl,
    city: LocalizedString(en: 'Rotterdam', tr: 'Rotterdam'),
    rating: 4.3,
    phone: '+31 10 555 1414',
    description: LocalizedString(
      en: 'Occupational medicine for maritime and logistics workers.',
      tr: 'Denizcilik ve lojistik çalışanları için iş sağlığı.',
    ),
  ),
  MockProviderSeed(
    id: '18',
    name: LocalizedString(
      en: 'Barcelona Dental & Implant House',
      tr: 'Barselona Diş ve İmplant Merkezi',
    ),
    category: _dent,
    country: _es,
    city: LocalizedString(en: 'Barcelona', tr: 'Barselona'),
    rating: 4.8,
    phone: '+34 93 555 1515',
    email: 'smile@barcelonadental.example',
    description: LocalizedString(
      en: 'Same-day emergency dentistry and digital smile design.',
      tr: 'Aynı gün acil diş ve dijital gülüş tasarımı.',
    ),
  ),
  MockProviderSeed(
    id: '19',
    name: LocalizedString(
      en: 'Madrid CardioVida Center',
      tr: 'Madrid CardioVida Merkezi',
    ),
    category: _cardio,
    country: _es,
    city: LocalizedString(en: 'Madrid', tr: 'Madrid'),
    rating: 4.7,
    email: 'contact@cardiovida.example',
    description: LocalizedString(
      en: 'Stress ECG, Holter monitoring, and heart failure clinic.',
      tr: 'Efor EKG, Holter takibi ve kalp yetmezliği polikliniği.',
    ),
  ),
  MockProviderSeed(
    id: '20',
    name: LocalizedString(
      en: 'Rome Ancient City Clinic',
      tr: 'Roma Klinik Merkezi',
    ),
    category: _derm,
    country: _it,
    city: LocalizedString(en: 'Rome', tr: 'Roma'),
    rating: 4.5,
    phone: '+39 06 555 1616',
    description: LocalizedString(
      en: 'Dermatology and allergy testing for residents and tourists.',
      tr: 'Yerel ve turistlere dermatoloji ve alerji testi.',
    ),
  ),
  MockProviderSeed(
    id: '21',
    name: LocalizedString(
      en: 'Milan Orthopedic Institute',
      tr: 'Milano Ortopedi Enstitüsü',
    ),
    category: _ortho,
    country: _it,
    city: LocalizedString(en: 'Milan', tr: 'Milano'),
    rating: 4.9,
    phone: '+39 02 555 1717',
    email: 'info@milanortho.example',
    description: LocalizedString(
      en: 'Robotic-assisted knee surgery and sports medicine.',
      tr: 'Robot destekli diz cerrahisi ve spor hekimliği.',
    ),
  ),
  MockProviderSeed(
    id: '22',
    name: LocalizedString(
      en: 'Vienna Mental Health Partners',
      tr: 'Viyana Ruh Sağlığı Ortaklığı',
    ),
    category: _psych,
    country: _at,
    city: LocalizedString(en: 'Vienna', tr: 'Viyana'),
    rating: 4.6,
    phone: '+43 1 555 1818',
    description: LocalizedString(
      en: 'CBT, burnout prevention, and multilingual counseling.',
      tr: 'BDT, tükenmişlik önleme ve çok dilli danışmanlık.',
    ),
  ),
  MockProviderSeed(
    id: '23',
    name: LocalizedString(
      en: 'Graz Pediatric House',
      tr: 'Graz Çocuk Sağlığı Evi',
    ),
    category: _ped,
    country: _at,
    city: LocalizedString(en: 'Graz', tr: 'Graz'),
    rating: 4.4,
    email: 'kids@grazpediatric.example',
    description: LocalizedString(
      en: 'Newborn care, growth tracking, and allergy panels for children.',
      tr: 'Yenidoğan bakımı, büyüme takibi ve çocuk alerji paneli.',
    ),
  ),
  MockProviderSeed(
    id: '24',
    name: LocalizedString(
      en: 'Kadıköy Family Polyclinic',
      tr: 'Kadıköy Aile Polikliniği',
    ),
    category: _gp,
    country: _tr,
    city: LocalizedString(en: 'Istanbul', tr: 'İstanbul'),
    rating: 4.5,
    phone: '+90 216 555 1919',
    email: 'randevu@kadikoypoly.example',
    description: LocalizedString(
      en: 'Walk-in blood tests, chronic care, and home visit options.',
      tr: 'Ayaküstü tahlil, kronik takip ve ev ziyareti seçenekleri.',
    ),
  ),
  MockProviderSeed(
    id: '25',
    name: LocalizedString(
      en: 'Eskişehir Physio Active',
      tr: 'Eskişehir Fizyo Active',
    ),
    category: _physio,
    country: _tr,
    city: LocalizedString(en: 'Eskisehir', tr: 'Eskişehir'),
    rating: 4.3,
    phone: '+90 222 555 2020',
    description: LocalizedString(
      en: 'Athlete recovery, posture correction, and hydrotherapy pool.',
      tr: 'Sporcu toparlanması, postür düzeltme ve hidroterapi havuzu.',
    ),
  ),
  MockProviderSeed(
    id: '26',
    name: LocalizedString(
      en: 'Gaziantep Women\'s Hospital',
      tr: 'Gaziantep Kadın Hastanesi',
    ),
    category: _gyn,
    country: _tr,
    city: LocalizedString(en: 'Gaziantep', tr: 'Gaziantep'),
    rating: 4.7,
    phone: '+90 342 555 2121',
    email: 'info@gaziantepwomen.example',
    description: LocalizedString(
      en: 'Maternity ward, NICU, and high-risk pregnancy unit.',
      tr: 'Doğum servisi, yenidoğan yoğun bakım ve riskli gebelik ünitesi.',
    ),
  ),
  MockProviderSeed(
    id: '27',
    name: LocalizedString(
      en: 'Trabzon Coast ENT Clinic',
      tr: 'Trabzon Sahil KBB Kliniği',
    ),
    category: _ent,
    country: _tr,
    city: LocalizedString(en: 'Trabzon', tr: 'Trabzon'),
    rating: 4.4,
    description: LocalizedString(
      en: 'Seasonal allergy care and diving-related ear treatment.',
      tr: 'Mevsimsel alerji bakımı ve dalış kaynaklı kulak tedavisi.',
    ),
  ),
  MockProviderSeed(
    id: '28',
    name: LocalizedString(
      en: 'Edinburgh Eye & Laser',
      tr: 'Edinburgh Göz ve Lazer',
    ),
    category: _eye,
    country: _uk,
    city: LocalizedString(en: 'Edinburgh', tr: 'Edinburgh'),
    rating: 4.8,
    phone: '+44 131 555 2222',
    email: 'book@edinburgheye.example',
    description: LocalizedString(
      en: 'LASIK consultations and macular degeneration monitoring.',
      tr: 'LASIK danışmanlığı ve makula dejenerasyonu takibi.',
    ),
  ),
  MockProviderSeed(
    id: '29',
    name: LocalizedString(
      en: 'Osaka Precision Surgery Center',
      tr: 'Osaka Hassas Cerrahi Merkezi',
    ),
    category: _hc,
    country: LocalizedString(en: 'Japan', tr: 'Japonya'),
    city: LocalizedString(en: 'Osaka', tr: 'Osaka'),
    rating: 4.9,
    email: 'contact@osakasurgery.example',
    description: LocalizedString(
      en: 'Minimally invasive surgery with bilingual patient coordinators.',
      tr: 'Çift dilli hasta koordinatörleri ile minimal invaziv cerrahi.',
    ),
  ),
  MockProviderSeed(
    id: '30',
    name: LocalizedString(
      en: 'Dublin Legal Health Advisory',
      tr: 'Dublin Sağlık Hukuku Danışmanlığı',
    ),
    category: _legal,
    country: LocalizedString(en: 'Ireland', tr: 'İrlanda'),
    city: LocalizedString(en: 'Dublin', tr: 'Dublin'),
    rating: 4.1,
    phone: '+353 1 555 2323',
    description: LocalizedString(
      en: 'Medical malpractice and patient rights advisory services.',
      tr: 'Tıbbi malpraktis ve hasta hakları danışmanlığı.',
    ),
  ),
];
