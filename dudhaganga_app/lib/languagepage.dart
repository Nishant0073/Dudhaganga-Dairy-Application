import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguagePage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'side_bar_home': 'Home',
          'side_bar_language': 'Language',
          'side_bar_profile': 'Edit Profile',
          'side_bar_theme': 'Theme',
          'side_bar_logout': 'Logout',
          'side_bar_choose_language': 'Choose Language',
          'side_bar_choose_theme': 'Theme',
          'side_bar_dark_mode': 'Dark Mode',
          'side_bar_light_mode': 'Light Mode',
          //1
          'user_home_page_morning': 'Morning',
          'user_home_page_collected_milk': 'Collected Milk',
          'user_home_page_remaining_farmer': 'Remaining Farmers',
          'user_home_page_sold_milk': 'Sold Milk',
          'user_home_page_customer': 'No. of Customers:',
          'user_home_page_reading': 'Take Reading',
          //2
          'profile_page_profile': 'Profile',
          'profile_page_farmer_name': 'Ram Mane',
          //3
          'add_milk_buyer_add_buyer': 'Add Milk Buyer',
          'add_milk_buyer_cancel': 'Cancel',
          'add_milk_buyer_ok': 'OK',
          'add_milk_buyer_customer_added': 'Customer Added successfully ',
          'add_milk_buyer_click_button': 'Click OK button to Add Milk Buyer',
          'add_milk_buyer_name': 'Name',
          'add_milk_buyer_enter_name': 'Please Enter name',
          'add_milk_buyer_name_here': 'Enter name here...',
          'add_milk_buyer_phone_no': 'Phone Number',
          'add_milk_buyer_select_time': 'Select time of milk',
          'add_milk_buyer_morning': 'Morning',
          'add_milk_buyer_evening': 'Evening',
          'add_milk_buyer_add_farmer': 'Add Farmer',
          //4
          'add_customer': 'Add customer',
          'add_customer_farmer': 'Farmer',
          'add_customer_milk_buyer': 'Milk Buyer',
          //5
          'add_farmer': 'Add Farmer',
          'add_farmer_phone_no': 'Please Enter Phone No.',
          'add_farmer_click_ok': 'Click OK button to Add Farmer',
          'add_farmer_customer_added': 'Farmer Added successfully',
          'add_farmer_select_type': 'Select Type of Milk',
          'add_farmer_cow': 'Cow',
          'add_farmer_buffalo': 'Buffalo',
          'add_farmer_unable_to_farmer': 'Unable to add Farmer.',
          //6
          'home_page_profile': 'Profile',
          //7
          'select_farmer': 'Select Farmer',
          'select_farmer_name': 'Farmer Name',
          //8
          'milk_reading_add_reading': 'Add Reading',
          //9
          'constants_app_name': 'Dudhaganga Dairy',
        },
        'hi_IN': {
          'side_bar_home': 'मुख्यपृष्ठ',
          'side_bar_language': 'भाषा',
          'side_bar_profile': 'प्रोफ़ाइल संपादित करें',
          'side_bar_theme': 'थीम',
          'side_bar_logout': 'लॉग आउट',
          'side_bar_choose_language': 'भाषा चुनें',
          'side_bar_choose_theme': 'थीम चुनें',
          'side_bar_dark_mode': 'डार्क मोड',
          'side_bar_light_mode': 'लाइट मोड',
          //1
          'user_home_page_morning': 'सुबह',
          'user_home_page_collected_milk': 'एकत्रित दूध',
          'user_home_page_remaining_farmer': 'शेष किसान',
          'user_home_page_sold_milk': 'दूध बेचा',
          'user_home_page_customer': 'ग्राहकों की संख्या',
          'user_home_page_reading': 'पढ़ना लो',
          //2
          'profile_page_profile': 'प्रोफ़ाइल',
          'profile_page_farmer_name': 'राम माने',
          //3
          'add_milk_buyer_add_buyer': 'दूध खरीदार जोड़ें',
          'add_milk_buyer_cancel': 'रद्द करना',
          'add_milk_buyer_ok': 'ठीक है',
          'add_milk_buyer_customer_added': 'ग्राहक सफलतापूर्वक जोड़ा गया',
          'add_milk_buyer_click_button':
              'दूध क्रेता जोड़ने के लिए ओके बटन पर क्लिक करें',
          'add_milk_buyer_name': 'नाम',
          'add_milk_buyer_enter_name': 'कृपया नाम दर्ज करें',
          'add_milk_buyer_name_here': 'यहाँ नाम दर्ज करें...',
          'add_milk_buyer_phone_no': 'फ़ोन नंबर',
          'add_milk_buyer_select_time': 'दूध का समय चुनें',
          'add_milk_buyer_morning': 'सुबह',
          'add_milk_buyer_evening': 'शाम',
          'add_milk_buyer_add_farmer': 'किसान जोड़ें',
          //4
          'add_customer': 'ग्राहक जोड़ें',
          'add_customer_farmer': 'किसान',
          'add_customer_milk_buyer': 'दूध का खरीदार',
          //5
          'add_farmer': 'किसान जोड़ें',
          'add_farmer_phone_no': 'कृपया फोन नंबर दर्ज करें।.',
          'add_farmer_click_ok': 'किसान जोड़ने के लिए OK बटन पर क्लिक करें',
          'add_farmer_customer_added': 'ग्राहक सफलतापूर्वक जोड़ा गया',
          'add_farmer_select_type': 'दूध का प्रकार चुनें',
          'add_farmer_cow': 'गाय',
          'add_farmer_buffalo': 'भैंस',
          'add_farmer_unable_to_farmer': 'किसान जोड़ने में विफल',
          //6
          'home_page_profile': 'प्रोफ़ाइल',
          //7
          'select_farmer': 'किसान का चयन करें',
          'select_farmer_name': 'किसान का नाम',
          //8
          'milk_reading_add_reading': 'पढ़ना जोड़ें',
          //9
          'constants_app_name': 'दूधगंगा डेयरी',
        },
        'mr_IN': {
          'side_bar_home': 'मुख्यपृष्ठ',
          'side_bar_language': 'भाषा',
          'side_bar_profile': 'प्रोफाईल संपादित करा',
          'side_bar_theme': 'थीम',
          'side_bar_logout': 'बाहेर पडणे',
          'side_bar_choose_language': 'भाषा निवडा',
          'side_bar_choose_theme': 'थीम निवडा',
          'side_bar_dark_mode': 'गडद मोड',
          'side_bar_light_mode': 'लाइट मोड',
          //1
          'user_home_page_morning': 'सकाळ',
          'user_home_page_collected_milk': 'दूध गोळा केले',
          'user_home_page_remaining_farmer': 'उरलेले शेतकरी',
          'user_home_page_sold_milk': 'दूध विकले',
          'user_home_page_customer': 'ग्राहकांची संख्या',
          'user_home_page_reading': 'वाचन घ्या',
          //2
          'profile_page_profile': 'प्रोफाइल',
          'profile_page_farmer_name': 'राम माने',
          //3
          'add_milk_buyer_add_buyer': 'दूध खरेदीदार जोडा',
          'add_milk_buyer_cancel': 'रद्द करा',
          'add_milk_buyer_ok': 'ठीक आहे',
          'add_milk_buyer_customer_added': 'ग्राहक यशस्वीरित्या जोडला गेला ',
          'add_milk_buyer_click_button':
              'दूध खरेदीदार जोडण्यासाठी ओके बटणावर क्लिक करा',
          'add_milk_buyer_name': 'नाव',
          'add_milk_buyer_enter_name': 'कृपया नाव प्रविष्ट करा',
          'add_milk_buyer_name_here': 'येथे नाव प्रविष्ट करा...',
          'add_milk_buyer_phone_no': 'फोन नंबर',
          'add_milk_buyer_select_time': 'दुधाची वेळ निवडा',
          'add_milk_buyer_morning': 'सकाळ',
          'add_milk_buyer_evening': 'संध्याकाळ',
          'add_milk_buyer_add_farmer': 'शेतकरी जोडा',
          //4
          'add_customer': 'ग्राहक जोडा',
          'add_customer_farmer': 'शेतकरी',
          'add_customer_milk_buyer': 'दूध खरेदीदार',
          //5
          'add_farmer': 'शेतकरी जोडा',
          'add_farmer_phone_no': 'कृपया फोन नंबर प्रविष्ट करा.',
          'add_farmer_click_ok': 'शेतकरी जोडण्यासाठी ओके बटणावर क्लिक करा',
          'add_farmer_customer_added': 'शेतकरी शस्वीरित्या जोडला गेला',
          'add_farmer_select_type': 'दुधाचा प्रकार निवडा',
          'add_farmer_cow': 'गाय',
          'add_farmer_buffalo': 'म्हैस',
          'add_farmer_unable_to_farmer': 'शेतकरी जोडण्यात अयशस्वी',
          //6
          'home_page_profile': 'प्रोफाइल',
          //7
          'select_farmer': 'शेतकरी निवडा',
          'select_farmer_name': 'शेतकऱ्याचे नाव',
          //8
          'milk_reading_add_reading': 'वाचन जोडा',
          //9
          'constants_app_name': 'दूधगंगा डेअरी',
        }
      };
}
