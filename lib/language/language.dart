import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel/local/languageCatch/local_catch.dart';

class LanguageChange extends Translations {
  final List language = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'khmer'.tr, 'locale': Locale('kh', 'KH')},
  ];

  updateLanguage(Locale locale) async {
    Get.back();
    Get.updateLocale(locale);
    await LocalCatch.instance.saveLanguage(locale.languageCode);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_US': {
          // Home Screen
          'hello': 'Hello,',
          'seeall': 'See All',
          'other': 'Others',
          'night': '/ Night',
          'bed': 'Bed :',
          // Naviga
          'home': 'Home',
          'booking': 'Booking',
          'profile': 'Profile',
          // Detail Screen
          'bookingNow': 'Booking Now!',
          'roomDetail': 'Room Detail',
          'gallery': 'Gallery Photos',
          'description': 'Description',
          'facilities': 'Facilities',
          'amentity': 'Amentity',
          'swimming': 'Swimming Pool',
          'wifi': 'WiFi',
          'resta': 'Restaurant',
          'parking': 'Parking',
          'meeting': 'Meeting Room',
          'fitness': 'Fitness Center',
          'elevator': 'Elevator',
          'open': '24-hours Open',
          'revieww': 'Review',
          // Select Date
          'select': 'Select Date',
          'in': 'Check In',
          'out': 'Check Out',
          'adult': 'Adult',
          'child': 'Child',
          'total': 'Total',
          'continue': 'Continue',
          // Booking
          'myBooking': 'My Booking',
          'noData': "No Data",
          'title': 'If you want to cancel please click on',
          'cancel': 'Cancel',
          // Profile
          'setting': 'Setting',
          'notification': 'Notification',
          'security': 'Security',
          'theme': 'Dark Theme',
          'logout': 'Logout',
          // Setting & privacy
          'seetingTitle': 'Settings & Privacy',
          'editPF': 'Edit Profile',
          'password': 'Password',
          'change': 'Change Language',
          'choose': 'Choose Language',
          'name': 'Name',
          'userName': 'Username',
          'address': 'Address',
          'email': 'Email',
          'phone': 'Phone Number',
          'update': 'Update',
          'changePass': 'Change Password',
          'oldPass': 'Old Password',
          'newPass': 'New Password',
          'comfirmPass': "Confirm Password",
          'khmer': 'KHMER',
          // Notification
          'gerneral': 'General Notification',
          'sound': 'Sound',
          'vibrate': 'Vibrate',
          // Security
          'face': 'Face ID',
          'remember': 'Remember me',
          'touch': 'Touch ID',
          //Botton Splash Screen
          'next': 'Next',
          'skip': 'Skip',
          'getStart': 'Get Started',
        },
        // =============================
        // Khmer
        'kh_KH': {
          // Home Screen
          'hello': 'សួរស្តី,',
          'seeall': 'មើលទាំងអស់',
          'other': 'ផ្សេងៗទៀត',
          'night': '/ យប់',
          'bed': 'គ្រែ :',
          // Naviga
          'home': 'ទំព័រដើម',
          'booking': 'កក់ទុក',
          'profile': 'ព័ត៏មានផ្ទាល់ខ្លួន',
          // Detail Screen
          'bookingNow': 'កក់ទុកឥឡូវ!',
          'roomDetail': 'ព័ត៏មានបន្ទប់',
          'gallery': 'កម្រងរូបភាព',
          'description': 'ពិពណ៌នា',
          'facilities': 'គ្រឿងបរិក្ខារ',
          'amentity': 'Amentity',
          'swimming': 'អាងហែលទឹក',
          'wifi': 'WiFi',
          'resta': 'ភោជនីយដ្ឋាន',
          'parking': 'ចំណត',
          'meeting': 'បន្ទប់ប្រជុំ',
          'fitness': 'ក្លឹបហាត់ប្រាណ',
          'elevator': 'ជណ្តើរប្រអប់',
          'open': 'បើក 24 ម៉ោង',
          'revieww': 'អ្នកមើល',
          // Select Date
          'select': 'ជ្រើសរើសថ្ងៃ',
          'in': 'ថ្ងៃចូល',
          'out': 'ថ្ងៃចេញ',
          'adult': 'មនុស្សធំ',
          'child': 'ក្មេង',
          'total': 'តម្លៃសរុប',
          'continue': 'បន្ត',
          // Booking
          'myBooking': 'ការកក់ទុករបស់ខ្ញុំ',
          'noData': "គ្មានទិន្ន័យ",
          'title': 'បើអ្នកចង់បោះបង់សូមចុច',
          'cancel': 'បោះបង់',
          // Profile
          'setting': 'ការកំណត់',
          'notification': 'ការជូនដំណឹង',
          'security': 'សុវត្ថិភាព',
          'theme': 'ប្តូរពណ៏',
          'logout': 'ចាកចេញ',
          // Setting & privacy
          'seetingTitle': 'ការកំណត់ & ឯកជនភាព',
          'editPF': 'កែព័ត៏មានផ្ទាន់ខ្លួន',
          'password': 'លេខសម្ងាត់',
          'change': 'ប្តូរភាសា',
          'choose': 'ជ្រឿសរើសភាសា',
          'name': 'ឈ្មោះ',
          'userName': 'ឈ្មោះប្រើប្រាស់',
          'address': 'ទីតាំង',
          'email': 'អុីមែល',
          'phone': 'លេខទូរសព្ទ័',
          'update': 'កែថ្មី',
          'changePass': 'ផ្លាស់ប្តូរលេខសម្ងាត់',
          'oldPass': 'លេខសម្ងាត់ចាស់',
          'newPass': 'លេខសម្ងាត់ថ្មី',
          'comfirmPass': 'ផ្ទៀងផ្ទាត់លេខសម្ងាត់',
          'khmer': 'ភាសាខ្មែរ',

          // Notification
          'gerneral': 'General Notification',
          'sound': 'សម្លេង',
          'vibrate': 'រោទ៍',
          // Security
          'face': 'ស្គេនមុខ',
          'remember': 'ចងចាំខ្ញុំ',
          'touch': 'ស្គេនម្រាមដៃ',
          //Botton Splash Screen
          'next': 'បន្ទាប់',
          'skip': 'រំលង',
          'getStart': 'ចាប់ផ្តើម',
        },
      };
}
