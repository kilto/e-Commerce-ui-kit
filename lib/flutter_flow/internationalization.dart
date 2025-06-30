import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th', 'ja', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
    String? jaText = '',
    String? deText = '',
  }) =>
      [enText, thText, jaText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OnboardPage
  {
    'wnu1pw5b': {
      'en': 'Discover Your Style',
      'de': '',
      'ja': '',
      'th': 'ค้นหาสไตล์ของคุณเอง',
    },
    'x92rxgve': {
      'en': 'Browse our extensive catalog of the latest fashion trends.',
      'de': '',
      'ja': '',
      'th': 'สำรวจคอลเลคชั่นแฟชั่นสุดฮิตของเรา',
    },
    'z00zwblj': {
      'en': 'Effortless Shopping ',
      'de': '',
      'ja': '',
      'th': 'ช้อปปิ้งง่ายๆ',
    },
    '71jalyaz': {
      'en':
          'Enjoy a smooth and intuitive checkout process, from cart to purchase.',
      'de': '',
      'ja': '',
      'th':
          'เพลิดเพลินไปกับกระบวนการชำระเงินที่ราบรื่นและใช้งานง่าย ตั้งแต่ตะกร้าสินค้าจนถึงการซื้อ  ',
    },
    'rxvi70er': {
      'en': 'Stay in Control',
      'de': '',
      'ja': '',
      'th': 'คุณกำหนดเองได้',
    },
    '8yygwjq0': {
      'en':
          'Easily track your orders, manage your profile, and leverage our powerful tools.',
      'de': '',
      'ja': '',
      'th':
          'ติดตามสถานะคำสั่งซื้อของคุณได้อย่างง่ายดาย, จัดการโปรไฟล์ของคุณ และใช้ประโยชน์จากเครื่องมืออันทรงพลังของเรา ',
    },
    '90eypg20': {
      'en': 'GET STARTED',
      'de': '',
      'ja': '',
      'th': 'เริ่มกันเลย',
    },
    'sxjofz8w': {
      'en': 'By proceeding, you agree to our term and condition ',
      'de': '',
      'ja': '',
      'th': 'ด้วยการดำเนินการต่อ ท่านยอมรับข้อกำหนดและเงื่อนไขของเรา',
    },
    'zhn0zmdb': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': 'หน้าแรก',
    },
  },
  // LoginPage
  {
    'wqu3x0x9': {
      'en': 'Login or Sign up',
      'de': '',
      'ja': '',
      'th': '',
    },
    'v77hmyiq': {
      'en': 'Email',
      'de': '',
      'ja': '',
      'th': '',
    },
    'cciqtses': {
      'en': 'Enter your email',
      'de': '',
      'ja': '',
      'th': '',
    },
    '6h4aogtg': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ui88amcg': {
      'en': 'Password',
      'de': '',
      'ja': '',
      'th': '',
    },
    'p0ri0ha0': {
      'en': 'Enter your password',
      'de': '',
      'ja': '',
      'th': '',
    },
    'n63k59kz': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'syynop1p': {
      'en': 'Sign up',
      'de': '',
      'ja': '',
      'th': '',
    },
    '742g3veh': {
      'en': 'Or',
      'de': '',
      'ja': '',
      'th': '',
    },
    '94kbyf8d': {
      'en': 'Continue with Google',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2q533i1b': {
      'en': 'Continue with Apple',
      'de': '',
      'ja': '',
      'th': '',
    },
    'o1ad963o': {
      'en': 'Continue with Facebook',
      'de': '',
      'ja': '',
      'th': '',
    },
    'i1lrrpz6': {
      'en': 'Sign in with Email',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // LoginWithEmailPage
  {
    'kr7m0fat': {
      'en': 'Login ',
      'de': '',
      'ja': '',
      'th': '',
    },
    '61lj24f8': {
      'en': 'Email',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9w6c6uu5': {
      'en': 'Enter your email',
      'de': '',
      'ja': '',
      'th': '',
    },
    '3ifcda1g': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'fhmrvw6p': {
      'en': 'Password',
      'de': '',
      'ja': '',
      'th': '',
    },
    'hjp4wfk0': {
      'en': 'Enter your password',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9jfbqgwf': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5sfqroum': {
      'en': 'Sign in',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ActivationEmailPage
  {
    'hex8rf10': {
      'en': 'Activation email sent',
      'de': '',
      'ja': '',
      'th': '',
    },
    'zldul2wm': {
      'en':
          'We have sent you an email with a link to activate your account. Please click on the link to complete the activation process.',
      'de': '',
      'ja': '',
      'th': '',
    },
    'g9jhh4qz': {
      'en': 'Sign in with Email',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // CartPage
  {
    'df1m01ng': {
      'en': 'Cart',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ze5lrcws': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    'rmlj6dt8': {
      'en': '\$523',
      'de': '',
      'ja': '',
      'th': '',
    },
    'pj39bc15': {
      'en': 'Proceed to Pay',
      'de': '',
      'ja': '',
      'th': '',
    },
    'e1r33p9g': {
      'en': 'Cart',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // HomePage
  {
    'tl47lrod': {
      'en': 'Search...',
      'de': '',
      'ja': '',
      'th': '',
    },
    '3vx0i228': {
      'en': 'Popular items ',
      'de': '',
      'ja': '',
      'th': '',
    },
    '8fgw3xay': {
      'en': 'See all',
      'de': '',
      'ja': '',
      'th': '',
    },
    'qkw0ea6w': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2ne2vrvf': {
      'en': 'Men',
      'de': '',
      'ja': '',
      'th': '',
    },
    'q15utl92': {
      'en': 'Woman',
      'de': '',
      'ja': '',
      'th': '',
    },
    '83tlfypy': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dx2u7bjf': {
      'en': 'Explore More ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'romfh07u': {
      'en': 'Collection',
      'de': '',
      'ja': '',
      'th': '',
    },
    'e58ra8pm': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ProductListPage
  {
    'ddnl49t9': {
      'en': '5 ITEMS',
      'de': '',
      'ja': '',
      'th': '',
    },
    'z7bvz6q7': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ProductDetailPage
  {
    'jydaza4g': {
      'en': 'Size',
      'de': '',
      'ja': '',
      'th': '',
    },
    'aob3r48u': {
      'en': 'XS',
      'de': '',
      'ja': '',
      'th': '',
    },
    'p06ya3y4': {
      'en': 'S',
      'de': '',
      'ja': '',
      'th': '',
    },
    'gvywfexd': {
      'en': 'M',
      'de': '',
      'ja': '',
      'th': '',
    },
    'rizyo0ti': {
      'en': 'L',
      'de': '',
      'ja': '',
      'th': '',
    },
    'gx3qp65m': {
      'en': 'XS',
      'de': '',
      'ja': '',
      'th': '',
    },
    'jrdngsxp': {
      'en': 'Colors',
      'de': '',
      'ja': '',
      'th': '',
    },
    'uutd3v5w': {
      'en': 'White',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dim7brne': {
      'en': 'Green',
      'de': '',
      'ja': '',
      'th': '',
    },
    '21izyyxp': {
      'en': 'Red',
      'de': '',
      'ja': '',
      'th': '',
    },
    'qwczcm7x': {
      'en': 'White',
      'de': '',
      'ja': '',
      'th': '',
    },
    'g2qygd23': {
      'en': 'Qty',
      'de': '',
      'ja': '',
      'th': '',
    },
    'fxtjfao0': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'uk93on6k': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '55l05l4l': {
      'en': 'Slim Trousers',
      'de': '',
      'ja': '',
      'th': '',
    },
    '4pvjgc3r': {
      'en': '\$79',
      'de': '',
      'ja': '',
      'th': '',
    },
    '1ykjsm21': {
      'en': '4.5 (10)',
      'de': '',
      'ja': '',
      'th': '',
    },
    'p8zu2iik': {
      'en':
          'Vintage inspired casual yet sophisticated men\'s outfit. Includes a white linen blazer with a relaxed, unstructured fit. ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'iko3gysm': {
      'en': 'Buy Now',
      'de': '',
      'ja': '',
      'th': '',
    },
    'toyhm0yo': {
      'en': 'Add to Cart',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ProfilePage
  {
    'hup2h024': {
      'en': 'Sarah John',
      'de': '',
      'ja': '',
      'th': '',
    },
    'svhvom95': {
      'en': 'sarahjohn@example.com',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5no81v7i': {
      'en': 'Account',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5khh6g4x': {
      'en': 'My Orders',
      'de': '',
      'ja': '',
      'th': '',
    },
    'x5018p4v': {
      'en': 'Payment Method',
      'de': '',
      'ja': '',
      'th': '',
    },
    'e5b5fy09': {
      'en': 'Shipping Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    '8kzuyref': {
      'en': 'Language',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vknvar5g': {
      'en': 'FAQ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'x9d683oo': {
      'en': 'Dark Mode',
      'de': '',
      'ja': '',
      'th': '',
    },
    'nkjatc5u': {
      'en': 'General ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'fjhceuto': {
      'en': 'Term and Condition',
      'de': '',
      'ja': '',
      'th': '',
    },
    'eigm7m4y': {
      'en': 'Sign out',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vop482uh': {
      'en': 'version 1.0.0 (10)',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9eqwz7lf': {
      'en': 'Profile',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // AddEditShippingAddressPage
  {
    'dyh4jiox': {
      'en': 'Full name',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5enzttzt': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'y2xzabc8': {
      'en': 'Enter your full name',
      'de': '',
      'ja': '',
      'th': '',
    },
    'u0mfyfo7': {
      'en': 'Phone number',
      'de': '',
      'ja': '',
      'th': '',
    },
    '96rlyxeo': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dnmwogg7': {
      'en': 'Enter your phone number',
      'de': '',
      'ja': '',
      'th': '',
    },
    'hfuqj7ba': {
      'en': 'Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ill3808p': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dw65xedz': {
      'en': 'Enter your address',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vah5vn6p': {
      'en': 'Additional Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    'lopwtk5l': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'hw88jhlb': {
      'en': 'Enter additional address information',
      'de': '',
      'ja': '',
      'th': '',
    },
    'h4ezhwfg': {
      'en': 'City',
      'de': '',
      'ja': '',
      'th': '',
    },
    '4wgidvt0': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dw56saul': {
      'en': 'Enter your city',
      'de': '',
      'ja': '',
      'th': '',
    },
    'j92im6pv': {
      'en': 'State',
      'de': '',
      'ja': '',
      'th': '',
    },
    'p9zomz83': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'adydoirp': {
      'en': 'Enter your state',
      'de': '',
      'ja': '',
      'th': '',
    },
    'wbcauwuo': {
      'en': 'Postal  Code',
      'de': '',
      'ja': '',
      'th': '',
    },
    'kafhv6o8': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'bgafy18a': {
      'en': 'Enter postal  code',
      'de': '',
      'ja': '',
      'th': '',
    },
    'iq4y4jlz': {
      'en': 'Country',
      'de': '',
      'ja': '',
      'th': '',
    },
    'batunuao': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ww2tpko0': {
      'en': 'Enter your country',
      'de': '',
      'ja': '',
      'th': '',
    },
    'f89kox6v': {
      'en': 'Save',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ReviewSummaryPage
  {
    'bm5o8qhh': {
      'en': '4.5 • 10 reviews',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9m1dja1p': {
      'en': 'Sarah Jones',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2me3kuhn': {
      'en': 'April 2024',
      'de': '',
      'ja': '',
      'th': '',
    },
    'yvjr871z': {
      'en':
          'This dress is exactly as pictured and fits true to size. It\'s flattering on a variety of body types and is perfect for travelling',
      'de': '',
      'ja': '',
      'th': '',
    },
    'aqaftmxk': {
      'en': 'Emily',
      'de': '',
      'ja': '',
      'th': '',
    },
    'in9ul8x4': {
      'en': 'April 2024',
      'de': '',
      'ja': '',
      'th': '',
    },
    'mdfo6211': {
      'en':
          'I\'m usually hesitant to order clothes online, but this dress was a perfect fit! The return policy also gave me peace of mind.',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dy4qzho8': {
      'en': 'Review And Rating',
      'de': '',
      'ja': '',
      'th': '',
    },
    'y24ij3lm': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // FavoritePage
  {
    'adsssott': {
      'en': '3 ITEMS',
      'de': '',
      'ja': '',
      'th': '',
    },
    'zgvxlffa': {
      'en': 'Favorite',
      'de': '',
      'ja': '',
      'th': '',
    },
    '939u5sof': {
      'en': 'Favorite',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // CheckOutPage
  {
    'u17agekv': {
      'en': 'Shipping Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    '17we8c67': {
      'en': 'Sarah Jones',
      'de': '',
      'ja': '',
      'th': '',
    },
    '6bexqf1q': {
      'en': 'Apt 456\n10 Elm Street\nAnytown, CA 12345',
      'de': '',
      'ja': '',
      'th': '',
    },
    'scbluwsn': {
      'en': 'Shipping Method',
      'de': '',
      'ja': '',
      'th': '',
    },
    'bdmbdjau': {
      'en': 'Standard',
      'de': '',
      'ja': '',
      'th': '',
    },
    'motsz957': {
      'en': 'Payment',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ehvexrua': {
      'en': 'Credit Card',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9ib2rt03': {
      'en': 'Subtotal',
      'de': '',
      'ja': '',
      'th': '',
    },
    'v9pifj9s': {
      'en': '\$523',
      'de': '',
      'ja': '',
      'th': '',
    },
    'aaqjxowc': {
      'en': 'Shipping Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    '57d4ad6b': {
      'en': '\$15',
      'de': '',
      'ja': '',
      'th': '',
    },
    'jfm25pod': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    'crhopiy1': {
      'en': '\$538',
      'de': '',
      'ja': '',
      'th': '',
    },
    'iqbe712o': {
      'en': 'Place Order',
      'de': '',
      'ja': '',
      'th': '',
    },
    '3b8j5oqn': {
      'en': 'Check out',
      'de': '',
      'ja': '',
      'th': '',
    },
    '7xsnmonc': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ShippingListPage
  {
    'n3zgi2hq': {
      'en': 'Shipping Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    'mgrpkyfw': {
      'en': 'Sarah Jones',
      'de': '',
      'ja': '',
      'th': '',
    },
    '83ubpr94': {
      'en': 'Edit',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vv1b07x0': {
      'en': 'Apt 456\n10 Elm Street\nAnytown, CA 12345',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2ku9zvif': {
      'en': 'Sarah Jones',
      'de': '',
      'ja': '',
      'th': '',
    },
    'nkfwifhb': {
      'en': 'Edit',
      'de': '',
      'ja': '',
      'th': '',
    },
    'kp1oyy1r': {
      'en': '22 Evergreen Terrace, Suite B\nSpringfield, IL 54321',
      'de': '',
      'ja': '',
      'th': '',
    },
    'v86w4rtd': {
      'en': 'Jane Smith',
      'de': '',
      'ja': '',
      'th': '',
    },
    'qph5cjzk': {
      'en': 'Edit',
      'de': '',
      'ja': '',
      'th': '',
    },
    'uul3z2x2': {
      'en': '123 Main Street\nAnytown, CA 12345',
      'de': '',
      'ja': '',
      'th': '',
    },
    'joocwliw': {
      'en': 'Add Shipping Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    'moqqu3i5': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ShippingMethodListPage
  {
    'vjfgs7hd': {
      'en': 'Shipping Method',
      'de': '',
      'ja': '',
      'th': '',
    },
    'jznmwh4t': {
      'en': 'Standard',
      'de': '',
      'ja': '',
      'th': '',
    },
    'kblkijyd': {
      'en': '\$15',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vyhl7rk3': {
      'en': 'Estimate Arrival 5 - 7 days',
      'de': '',
      'ja': '',
      'th': '',
    },
    'e1ui9r5h': {
      'en': 'Extra ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'dtt70h4x': {
      'en': '\$35',
      'de': '',
      'ja': '',
      'th': '',
    },
    '1k5o0qym': {
      'en': 'Estimate Arrival 3 - 4 days',
      'de': '',
      'ja': '',
      'th': '',
    },
    'pqff2fph': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // PaymentMethodPage
  {
    'sgblyaef': {
      'en': 'Payment Method',
      'de': '',
      'ja': '',
      'th': '',
    },
    'k13pdch0': {
      'en': 'MasterCard 6577',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ny566x5y': {
      'en': 'MasterCard 3450',
      'de': '',
      'ja': '',
      'th': '',
    },
    'kxxtvmme': {
      'en': 'Amex 8908',
      'de': '',
      'ja': '',
      'th': '',
    },
    '3g1bn7w1': {
      'en': 'Add New Method',
      'de': '',
      'ja': '',
      'th': '',
    },
    '0bvnd134': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // AddEditCreditCardPage
  {
    'fn4r09tm': {
      'en': 'Card Number',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5x2lwt2s': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'j1j1egqv': {
      'en': 'Enter your card number',
      'de': '',
      'ja': '',
      'th': '',
    },
    'nsadhc52': {
      'en': 'Exp. Date',
      'de': '',
      'ja': '',
      'th': '',
    },
    'heik1jqh': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '62rdssac': {
      'en': 'Enter Exp Date',
      'de': '',
      'ja': '',
      'th': '',
    },
    'e6virvpu': {
      'en': 'CCV',
      'de': '',
      'ja': '',
      'th': '',
    },
    '32qui1vf': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'qooibvs0': {
      'en': 'Enter CCV',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ch6mejqj': {
      'en': 'Name on Card',
      'de': '',
      'ja': '',
      'th': '',
    },
    '3yes9cza': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'wom1toiw': {
      'en': 'Enter Name on Card',
      'de': '',
      'ja': '',
      'th': '',
    },
    'nqg9uhns': {
      'en': 'Save',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // AddPaymentMethodPage
  {
    'yy6cvuz4': {
      'en': 'Add New Payment ',
      'de': '',
      'ja': '',
      'th': '',
    },
    's8qvx4rm': {
      'en': 'Debit/Credit',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ukrf867u': {
      'en': 'PayPal',
      'de': '',
      'ja': '',
      'th': '',
    },
    'i73r320q': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // SuccessfulPaymentPage
  {
    'rc3am8jl': {
      'en': 'Payment Success',
      'de': '',
      'ja': '',
      'th': '',
    },
    'h42y7mku': {
      'en': 'Order ID: 45678 ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'oxbdchbe': {
      'en':
          'Your payment has been successful. Your order is now being processed and will be shipped soon. You can track your order status within the app',
      'de': '',
      'ja': '',
      'th': '',
    },
    'wjv6x7fr': {
      'en': 'Continue Shopping',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // OrderHistoryPage
  {
    'cb0rj1li': {
      'en': 'Shipping',
      'de': '',
      'ja': '',
      'th': '',
    },
    '46m2608c': {
      'en': 'Order Received',
      'de': '',
      'ja': '',
      'th': '',
    },
    'diojk9ln': {
      'en': '16 Dec 2024, Order ID: 456781',
      'de': '',
      'ja': '',
      'th': '',
    },
    'gczh9jv1': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5fxz273s': {
      'en': '\$350',
      'de': '',
      'ja': '',
      'th': '',
    },
    'f56yodm6': {
      'en': 'In Transit',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ex9ly53o': {
      'en': '15 Dec 2024, Order ID: 456780',
      'de': '',
      'ja': '',
      'th': '',
    },
    'uqtqrczi': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    'lw687gct': {
      'en': '\$75',
      'de': '',
      'ja': '',
      'th': '',
    },
    's8k9crfh': {
      'en': 'Arrived Item',
      'de': '',
      'ja': '',
      'th': '',
    },
    '97z82aw7': {
      'en': 'Item arrived',
      'de': '',
      'ja': '',
      'th': '',
    },
    'lhqm3dvb': {
      'en': '14 Dec 2024, Order ID: 456770',
      'de': '',
      'ja': '',
      'th': '',
    },
    't7ztjb7t': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    '19fbhcrp': {
      'en': '\$53.69',
      'de': '',
      'ja': '',
      'th': '',
    },
    '7nz48m9e': {
      'en': 'Item arrived',
      'de': '',
      'ja': '',
      'th': '',
    },
    'm2hbx9w5': {
      'en': '13 Dec 2024, Order ID: 456769',
      'de': '',
      'ja': '',
      'th': '',
    },
    'goganrbe': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    'h0s7f953': {
      'en': '\$150',
      'de': '',
      'ja': '',
      'th': '',
    },
    'a69vtp1e': {
      'en': 'Order History',
      'de': '',
      'ja': '',
      'th': '',
    },
    '0b83lpif': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // OrderHistoryDetailPage
  {
    'vvmauv9p': {
      'en': 'Order Details',
      'de': '',
      'ja': '',
      'th': '',
    },
    'epqjvo1d': {
      'en': 'Order  Received',
      'de': '',
      'ja': '',
      'th': '',
    },
    'rar0p9kv': {
      'en': 'In transit ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'l10ucxdd': {
      'en': 'Estimate Arrival Date: 22 Dec 2024',
      'de': '',
      'ja': '',
      'th': '',
    },
    'n257z2wt': {
      'en': '16 Dec 2024, Order ID: 456781',
      'de': '',
      'ja': '',
      'th': '',
    },
    'fos0bvio': {
      'en': 'Total',
      'de': '',
      'ja': '',
      'th': '',
    },
    'lfal15q5': {
      'en': '\$350',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2qzvpi8k': {
      'en': 'Shipping Address',
      'de': '',
      'ja': '',
      'th': '',
    },
    'nj19ujj5': {
      'en': 'Sarah Jones',
      'de': '',
      'ja': '',
      'th': '',
    },
    'tvy503w3': {
      'en': 'Apt 456\n10 Elm Street\nAnytown, CA 12345',
      'de': '',
      'ja': '',
      'th': '',
    },
    'wff58t0g': {
      'en': 'Shipping Method',
      'de': '',
      'ja': '',
      'th': '',
    },
    'b0o7d6zh': {
      'en': 'Standard',
      'de': '',
      'ja': '',
      'th': '',
    },
    's8doj99h': {
      'en': 'Payment',
      'de': '',
      'ja': '',
      'th': '',
    },
    'xc5jl4wc': {
      'en': 'Credit Card',
      'de': '',
      'ja': '',
      'th': '',
    },
    'js8vwwey': {
      'en': 'Give Feedback',
      'de': '',
      'ja': '',
      'th': '',
    },
    '41jivyzs': {
      'en': 'Buy Again',
      'de': '',
      'ja': '',
      'th': '',
    },
    'mvqgzmx3': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // AddReviewPage
  {
    'xkmcigfg': {
      'en': 'Summary Rating',
      'de': '',
      'ja': '',
      'th': '',
    },
    'rn6i9vut': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'aobs0d95': {
      'en': 'Sarah Jones',
      'de': '',
      'ja': '',
      'th': '',
    },
    'whm8f3dx': {
      'en': 'Submit',
      'de': '',
      'ja': '',
      'th': '',
    },
    'izor7ppd': {
      'en': 'Review And Rating',
      'de': '',
      'ja': '',
      'th': '',
    },
    'r32spyji': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // EditProfilePage
  {
    '66hu4b0q': {
      'en': 'Edit Profile',
      'de': '',
      'ja': '',
      'th': '',
    },
    'm890yrmj': {
      'en': 'Full name',
      'de': '',
      'ja': '',
      'th': '',
    },
    'n236otyf': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'y96fejg9': {
      'en': 'Enter your full name',
      'de': '',
      'ja': '',
      'th': '',
    },
    'cypdcawh': {
      'en': 'Email',
      'de': '',
      'ja': '',
      'th': '',
    },
    'nx83fy3p': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'quekqtwr': {
      'en': 'Enter your email',
      'de': '',
      'ja': '',
      'th': '',
    },
    'erj43av0': {
      'en': 'Save',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // HelpPage
  {
    'a2u2572y': {
      'en': 'FAQ',
      'de': '',
      'ja': '',
      'th': '',
    },
    'l2tme46o': {
      'en': 'How do I place an order',
      'de': '',
      'ja': '',
      'th': '',
    },
    'qw0caumq': {
      'en':
          'Browse products, add them to your cart, and proceed to checkout. You\'ll need to create an account or checkout as a guest. During checkout, enter your shipping information and choose a payment method.',
      'de': '',
      'ja': '',
      'th': '',
    },
    'x1ysxvk4': {
      'en': 'What payment methods do you accept',
      'de': '',
      'ja': '',
      'th': '',
    },
    'tdsrj9gu': {
      'en': 'We accept major credit cards, debit cards and Paypal',
      'de': '',
      'ja': '',
      'th': '',
    },
    '246qvpwr': {
      'en': 'Can I cancel my order?',
      'de': '',
      'ja': '',
      'th': '',
    },
    'd5va3f7p': {
      'en':
          'Yes, you can cancel your order as long as it hasn\'t been shipped yet. Contact customer service for assistance.',
      'de': '',
      'ja': '',
      'th': '',
    },
    'lpe5qrza': {
      'en': 'What is your return policy?',
      'de': '',
      'ja': '',
      'th': '',
    },
    'oy9zl7y8': {
      'en':
          'We offer returns within 3 days of purchase for most items. See our return policy page for details on exclusions and procedures.',
      'de': '',
      'ja': '',
      'th': '',
    },
    'd50wrcch': {
      'en': 'How long does it take to get a refund?',
      'de': '',
      'ja': '',
      'th': '',
    },
    '8c3y8795': {
      'en':
          'Refunds are typically processed within 7 business days after receiving your returned item.',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ey0zq0ed': {
      'en': 'Profile',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // LanguagePage
  {
    'x7c3hzls': {
      'en': 'Language',
      'de': '',
      'ja': '',
      'th': '',
    },
    'l3ch4f5b': {
      'en': 'English',
      'de': '',
      'ja': '',
      'th': '',
    },
    'abs5l7e2': {
      'en': 'Thailand',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2zg8sdkk': {
      'en': 'Japanese',
      'de': '',
      'ja': '',
      'th': '',
    },
    'h6zdba6t': {
      'en': 'German',
      'de': '',
      'ja': '',
      'th': '',
    },
    'f5en4bxc': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // FilterBottomSheet
  {
    'gu7c58w4': {
      'en': 'Filters',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ngqdt9hq': {
      'en': 'Prices',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vzvlbvng': {
      'en': 'Mix Price',
      'de': '',
      'ja': '',
      'th': '',
    },
    'btj0gie0': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'xnq6y6tt': {
      'en': 'Max Price',
      'de': '',
      'ja': '',
      'th': '',
    },
    'mrm7tx8p': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'l4sermp9': {
      'en': 'Gender',
      'de': '',
      'ja': '',
      'th': '',
    },
    'tolc7lyz': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'd29o587l': {
      'en': 'Men',
      'de': '',
      'ja': '',
      'th': '',
    },
    'a0ngjxs2': {
      'en': 'Woman',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2hxmix10': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'y5za98xw': {
      'en': 'Rating',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2ncqhhjc': {
      'en': 'Size',
      'de': '',
      'ja': '',
      'th': '',
    },
    'wlvfx0i7': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'qo90ocp3': {
      'en': 'XXS',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9bcylm66': {
      'en': 'XS',
      'de': '',
      'ja': '',
      'th': '',
    },
    '1g38242h': {
      'en': 'S',
      'de': '',
      'ja': '',
      'th': '',
    },
    '1fcec6uc': {
      'en': 'M',
      'de': '',
      'ja': '',
      'th': '',
    },
    '3209gwfz': {
      'en': 'L',
      'de': '',
      'ja': '',
      'th': '',
    },
    '28x6o061': {
      'en': 'XL',
      'de': '',
      'ja': '',
      'th': '',
    },
    'liphbim9': {
      'en': 'XXL',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ojy9azvi': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'h41brb9c': {
      'en': 'Product Type',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2pb5xk7g': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'kpj94g5u': {
      'en': 'Dresses',
      'de': '',
      'ja': '',
      'th': '',
    },
    'hh8gms43': {
      'en': 'Outerwear',
      'de': '',
      'ja': '',
      'th': '',
    },
    'xf8ysbeh': {
      'en': 'Sneakers',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vszqsztq': {
      'en': 'Boots',
      'de': '',
      'ja': '',
      'th': '',
    },
    'p7wy4ve5': {
      'en': 'Sandals',
      'de': '',
      'ja': '',
      'th': '',
    },
    '7i77zxj0': {
      'en': 'XL',
      'de': '',
      'ja': '',
      'th': '',
    },
    'fzp7t2n4': {
      'en': 'Dress Shoes',
      'de': '',
      'ja': '',
      'th': '',
    },
    'eu99bgxo': {
      'en': 'Bags',
      'de': '',
      'ja': '',
      'th': '',
    },
    'yohqedx8': {
      'en': 'Belts',
      'de': '',
      'ja': '',
      'th': '',
    },
    '2vglb45m': {
      'en': 'All',
      'de': '',
      'ja': '',
      'th': '',
    },
    'm71jg75y': {
      'en': 'Reset',
      'de': '',
      'ja': '',
      'th': '',
    },
    'xi9ap8fg': {
      'en': 'Save',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ItemListCart
  {
    'wdd50fw6': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '70oqvkvu': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // ItemListOrderHistory
  {
    'azwvgupb': {
      'en': ' x1',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
  // Miscellaneous
  {
    'tmeye5m1': {
      'en': 'Home',
      'de': '',
      'ja': '',
      'th': '',
    },
    'g9lkg0n6': {
      'en': 'Button',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ked9qy9n': {
      'en': 'Button',
      'de': '',
      'ja': '',
      'th': '',
    },
    '8kvwijre': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'h6rrspz9': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '45nn3tcj': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'pa9wcjxp': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '82m8vjck': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'oxur6sc7': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'vkhw3kyh': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'q77oah3b': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '56apx2jx': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'x4a8jmme': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'mfvfuxch': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '67ymxqdf': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '1hdff6p8': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'scq8gzxf': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '43vfjhv5': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'gdsuyejs': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'l0ufpxfq': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'wc3bf5n0': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '9yyog4ho': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '494i0p05': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '1oaqaptx': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'hymi02oi': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    's9pnay0r': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'ye9wqiyw': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    '5tvhzcyy': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'p7moz8ve': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
    'oi7w3ysr': {
      'en': '',
      'de': '',
      'ja': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
