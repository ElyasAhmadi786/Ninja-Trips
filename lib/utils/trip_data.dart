import 'package:trips/models/trip.dart';
import 'package:trips/utils/language_manager.dart';

List<Trip> tripList = [
  Trip(
    id: '1',
    title: LanguageManager.currentLanguage == 'fa' ? 'بهشت ساحلی' : 'Beach Paradise',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'تجربه تعطیلات ساحلی نهایی با آب‌های زلال، سواحل شنی سفید و هتل‌های لوکس. مناسب برای علاقه‌مندان به استراحت و ورزش‌های آبی.'
        : 'Experience the ultimate beach vacation with crystal clear waters, white sandy beaches, and luxurious resorts. Perfect for relaxation and water sports enthusiasts.',
    price: 350,
    nights: 3,
    img: 'beach.png',
    rating: 4.8,
    category: 'Beach',
    location: LanguageManager.currentLanguage == 'fa' ? 'مالدیو' : 'Maldives',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['همه چیز شامل', 'ساحل خصوصی', 'اسپا', 'ورزش‌های آبی']
        : ['All Inclusive', 'Private Beach', 'Spa', 'Water Sports'],
    isPopular: true,
  ),
  Trip(
    id: '2',
    title: LanguageManager.currentLanguage == 'fa' ? 'پناهگاه کوهستانی' : 'Mountain Retreat',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'به کوهستان پناه ببرید برای هوای تازه، مسیرهای کوهنوردی و مناظر نفس‌گیر. کلبه‌های دنج و ماجراجویی‌های فضای باز در انتظار شماست.'
        : 'Escape to the mountains for fresh air, hiking trails, and breathtaking views. Cozy cabins and outdoor adventures await.',
    price: 450,
    nights: 4,
    img: 'mountain.png',
    rating: 4.6,
    category: 'Mountain',
    location: LanguageManager.currentLanguage == 'fa' ? 'آلپ سوئیس' : 'Swiss Alps',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['کوهنوردی', 'اقامت در کلبه', 'آتش کمپ', 'حیات وحش']
        : ['Hiking', 'Cabin Stay', 'Campfire', 'Wildlife'],
    isPopular: false,
  ),
  Trip(
    id: '3',
    title: LanguageManager.currentLanguage == 'fa' ? 'تور چراغان شهر' : 'City Lights Tour',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'زندگی پر جنب‌وجوش شهری، نقاط دیدنی تاریخی و لذت‌های آشپزی را در یکی از هیجان‌انگیزترین شهرهای جهان کشف کنید.'
        : 'Explore vibrant city life, historical landmarks, and culinary delights in one of the world\'s most exciting cities.',
    price: 550,
    nights: 5,
    img: 'city.png',
    rating: 4.7,
    category: 'City',
    location: LanguageManager.currentLanguage == 'fa' ? 'نیویورک' : 'New York',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['تورهای شهری', 'موزه‌ها', 'رستوران‌های عالی', 'خرید']
        : ['City Tours', 'Museums', 'Fine Dining', 'Shopping'],
    isPopular: true,
  ),
  Trip(
    id: '4',
    title: LanguageManager.currentLanguage == 'fa' ? 'ماجراجویی بیابانی' : 'Desert Adventure',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'جادوی بیابان را با سواری بر شتر، تماشای ستاره‌ها و تجربیات سنتی بادیه‌نشینان کشف کنید.'
        : 'Discover the magic of the desert with camel rides, stargazing, and traditional Bedouin experiences.',
    price: 400,
    nights: 3,
    img: 'desert.png',
    rating: 4.5,
    category: 'Desert',
    location: LanguageManager.currentLanguage == 'fa' ? 'دبی' : 'Dubai',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['سواری شتر', 'کمپ بیابانی', 'تماشای ستاره‌ها', 'شام باربیکیو']
        : ['Camel Rides', 'Desert Camp', 'Stargazing', 'BBQ Dinner'],
    isPopular: false,
  ),
  Trip(
    id: '5',
    title: LanguageManager.currentLanguage == 'fa' ? 'رزورت اسکی' : 'Ski Resort',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'در یکی از بهترین رزورت‌های اسکی با مربیان متخصص و کلبه‌های کوهستانی دنج اسکی کنید.'
        : 'Hit the slopes at one of the best ski resorts with expert instructors and cozy mountain lodges.',
    price: 650,
    nights: 6,
    img: 'ski.png',
    rating: 4.9,
    category: 'Mountain',
    location: LanguageManager.currentLanguage == 'fa' ? 'آسپن' : 'Aspen',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['پاس اسکی', 'تجهیزات', 'کلاس‌های آموزشی', 'جکوزی']
        : ['Ski Pass', 'Equipment', 'Lessons', 'Hot Tub'],
    isPopular: true,
  ),
  Trip(
    id: '6',
    title: LanguageManager.currentLanguage == 'fa' ? 'جزیره گردی' : 'Island Hopping',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'از چندین جزیره دیدن کنید که هر کدام جذابیت، فرهنگ و زیبایی طبیعی منحصربه‌فرد خود را دارند.'
        : 'Visit multiple islands, each with its own unique charm, culture, and natural beauty.',
    price: 750,
    nights: 7,
    img: 'island.png',
    rating: 4.8,
    category: 'Island',
    location: LanguageManager.currentLanguage == 'fa' ? 'فیلیپین' : 'Philippines',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['تورهای قایقی', 'شیرجه', 'تور جزیره', 'غذای محلی']
        : ['Boat Tours', 'Snorkeling', 'Island Tours', 'Local Food'],
    isPopular: true,
  ),
  Trip(
    id: '7',
    title: LanguageManager.currentLanguage == 'fa' ? 'ساحل طلایی' : 'Golden Beach',
    description: LanguageManager.currentLanguage == 'fa'
        ? 'لذت بردن از سواحل طلایی و آب‌های فیروزه‌ای در یک محیط آرام و دنج.'
        : 'Enjoy golden beaches and turquoise waters in a peaceful and cozy environment.',
    price: 280,
    nights: 2,
    img: 'beach.png',
    rating: 4.3,
    category: 'Beach',
    location: LanguageManager.currentLanguage == 'fa' ? 'بانکوک' : 'Bangkok',
    features: LanguageManager.currentLanguage == 'fa'
        ? ['اقامت ساحلی', 'غذای محلی', 'تور قایق']
        : ['Beach Stay', 'Local Food', 'Boat Tour'],
    isPopular: false,
  ),
];