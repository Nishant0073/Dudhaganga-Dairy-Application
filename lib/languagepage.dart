import 'package:get/get.dart';

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

          //10
          'milk_reading_name': 'Name',
          'milk_reading_time': 'Time',
          'milk_reading_morning': 'Moring',
          'milk_reading_evening': 'Evening',
          'milk_reading_quantity': 'Quantity',
          'milk_reading_quantity_liter': 'Enter Milk Quantity in Liter',
          'milk_reading_fat': 'Fat',
          'milk_reading_submit': 'Submit',
          'milk_reading_enter_fat': 'Enter Milk Fat',

          //take reading page:
          'select_milk_type': 'Type of milk',

          //home page
          'view_history': 'view history',

          //view history
          'view_All_recrods': 'View All Recrods',
          'view_All_bills': 'View All Bills',

          '1': 'January',
          '2': 'February',
          '3': 'March',
          '4': 'April',
          '5': 'May',
          '6': 'June',
          '7': 'July',
          '8': 'August',
          '9': 'September',
          '10': 'October',
          '11': 'November',
          '12': 'December',

          //farmer details
          'farmer_name': 'Farmer Name',
          'month_year': 'Month Year',

          //bill details
          'total_bill_price': 'Total Bill Price',
          'total_milk_collected': 'Total Milk Collected',
          'date': 'Date',
          'time': 'Time',
          'cattle': 'Cattle',
          'litre': 'Litre',
          'fat': 'Fat',
          'rate': 'Rate',
          'total': 'Total',
          'cow': 'Cow',
          'buffalo': 'Buffalo',
          //new keys
          'morning': 'Morning',
          'evening': 'Evening',
          'view_payments': 'View Payments'
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
          //10
          'milk_reading_name': 'नाम',
          'milk_reading_time': 'समय',
          'milk_reading_morning': 'सुबह',
          'milk_reading_evening': 'शाम',
          'milk_reading_quantity': 'मात्रा',
          'milk_reading_quantity_liter': 'दूध की मात्रा लीटर में दर्ज करें',
          'milk_reading_fat': 'फॅट',
          'milk_reading_submit': 'सबमीट',
          'milk_reading_enter_fat': 'दूध फॅट दर्ज करें',
          //take reading page:
          'select_milk_type': 'दूध का प्रकार',

          //home page
          'view_history': 'इतिहास देखें',

          //view history
          'view_All_recrods': 'सभी रिकॉर्ड देखें',
          'view_All_bills': 'सभी बिल देखें',
          //months
          '1': 'जनवरी',
          '2': 'फरवरी',
          '3': 'मार्च',
          '4': 'अप्रैल',
          '5': 'मई',
          '6': 'जून',
          '7': 'जुलाई',
          '8': 'अगस्त',
          '9': 'सितंबर',
          '10': 'अक्टूबर',
          '11': 'नवंबर',
          '12': 'दिसंबर',
          //farmer details
          'farmer_name': 'किसान का नाम',
          'month_year': 'महीना साल',

          //bill details
          'total_bill_price': 'कुल बिल कीमत',
          'total_milk_collected': 'कुल दूध इकट्ठा हुआ',
          'date': 'तारीख',
          'time': 'समय',
          'cattle': 'पशु',
          'litre': 'लीटर',
          'fat': 'वसा',
          'rate': 'दर',
          'total': 'कुल',
          'cow': 'गाय',
          'buffalo': 'भैंस',
          //new translations
          'morning': 'सुबह',
          'evening': 'शाम',
          'view_payments': 'भुगतान देखें'
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
          //10
          'milk_reading_name': 'नाव',
          'milk_reading_time': 'वेळ',
          'milk_reading_morning': 'सकाळ',
          'milk_reading_evening': 'संध्याकाळ',
          'milk_reading_quantity': 'प्रमाण',
          'milk_reading_quantity_liter': 'दुधाचे प्रमाण लिटरमध्ये टाका',
          'milk_reading_fat': 'फॅट',
          'milk_reading_submit': 'सबमीट',
          'milk_reading_enter_fat': 'दूध फॅट प्रविष्ट करा',
          //take reading page:
          'select_milk_type': 'दुधाचा प्रकार',

          //home page
          'view_history': 'इतिहास पहा',

          //view history
          'view_All_recrods': 'सर्व रेकॉर्ड पहा',
          'view_All_bills': 'सर्व बिले पहा',

          //moths
          '1': 'जानेवारी',
          '2': 'फेब्रुवारी',
          '3': 'मार्च',
          '4': 'एप्रिल',
          '5': 'मे',
          '6': 'जून',
          '7': 'जुलै',
          '8': 'ऑगस्ट',
          '9': 'सप्टेंबर',
          '10': 'ऑक्टोबर',
          '11': 'नोव्हेंबर',
          '12': 'डिसेंबर',
          //farmer details
          'farmer_name': 'शेतकरीचे नाव',
          'month_year': 'महिना वर्ष',

          //bill details
          'total_bill_price': 'एकूण बिल दर',
          'total_milk_collected': 'एकूण दूध वजन',
          'date': 'तारीख',
          'time': 'वेळ',
          'cattle': 'पशु',
          'litre': 'लिटर',
          'fat': 'फॅट',
          'rate': 'दर',
          'total': 'एकूण',
          'cow': 'गाय',
          'buffalo': 'म्हैस',
          //new translations
          'morning': 'सकाळ',
          'evening': 'संध्याकाळ',
          'view_payments': 'भुगताने पहा'
        }
      };
}
