import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> sendMilkCollectedSMS(
    {String? amount,
    String? fat,
    String? weight,
    String? time,
    String? rate,
    String? cattle,
    String? contactNumber}) async {
  var headers = {
    'authorization':
        'HnzKw86EPNacrJ7Vep21Bsf9mviOd3FYWuGIk0xt5lqARCbLQD0xdzbQ79yZFrES5twjXlHqeB8OVTWa',
    'Content-Type': 'application/json',
    'Cookie':
        'XSRF-TOKEN=eyJpdiI6IjZxQUtLdHJnUW5JRjZETzBwWmoxeXc9PSIsInZhbHVlIjoibWdrTmFBZCswdUxnTXdiQ1FlN1lwYnM4VDNiU3djNGJNN1ViQWVTVlRNMzZRYnpkTkt3QVBKOVpWTVwvT0R2ajh1TTVmM0NcL3dEcVV3VU11Mk1rZEdnZz09IiwibWFjIjoiMmYyYmM3NzM2NmI4NTM4OTlmYWEzN2NjNWE5ZTg0MWQzYmQ5YTU0OWUyNDAwODlhNDlmMmUxYWRlYmRiOGUxYyJ9; laravel_session=eyJpdiI6IitZQTFhV1lyN1VWWE5ub0hWamdRbXc9PSIsInZhbHVlIjoiM05yU01RZEhMblBZdGtyM0FBcWF2R1RJNnpwS1dlK3FcL3plK2pYSjlvNkxjQ3RPUVVqSHVJdnRWVzhzbGVVSEhOMEp3NG9SdGhMbDFzbVVac0xqc0VRPT0iLCJtYWMiOiI1ZDQ3MzcwYzdjZjNlNzczNDgzMzVkMTJhN2NiNTQ5OWY2ZDFhNGQxNTY3ZWFkNmM4YzI5MmQwYTA1Y2M2YzUzIn0%3D; nypvL2vO2RIBNhrMAN8sSp38OWstdwknkPXus6WO=eyJpdiI6InBvUzZCVU5RNHZEc0h4QlhBYWVNQ3c9PSIsInZhbHVlIjoiRHJjQmtOelpVc2xqT0RcL3M0Y1VjaEdCZXQ0OEJZXC9FV3VESGhramF3RndcL1dLVTZsOXl0SXRVUkxhWnRmanYxOWpXZHVUNlZXSXlOQndvcHVnKzB6OVBFRlA4cHdKeVZvXC9Ic1ozQmJJWXhnT1JYUmpQblJKZTg2TmQ2aW5SblI3UlcxZTlcL0g4T0pJOXpucCtyT25NT2hqU0RnZURDN014VE05R3NsazVOYzk4azVxWDcrNHVSR3JRK29ZQmdhRE5nOENWMEM3SW9qN1gxYWVjR3V5ZlVaeklLRXhhTzdzQk9SN0lzUHRCQWhXTEUzTjJ3TUV6Z3k5ZkZNRkF5Z0JhU1o2ajJqWHdFYmx4eGFlQ3VEZ0ZrN09NRVV3Vk5POVFpVFd5MkhBSmpSODNzVTFKXC9XOVQ5eEVGeElSeGwrMXUzWTJyblk0b1k4Z2ZvUHVcLzVNcGo2dz09IiwibWFjIjoiNzMzNWE1NmI1YmU3OTk1OWZlYWU2OTJiZWE1YWQxNTNmNTA3MmU0YmFkMTE3NTQ5MWEyNDFiM2JmZTMyNjlmNiJ9'
  };
  var request =
      http.Request('POST', Uri.parse('https://www.fast2sms.com/dev/bulkV2'));
  request.body = json.encode({
    "route": "v3",
    "sender_id": "FTWSMS",
    "message":
        "Hi Farmer, \nWeight: $weight \nFat: $fat \nCattle:$cattle \nRate: Rs. $rate\nTotal: Rs. $amount \nCollected at $time.\nThanks,\nDudhaganga Dairy",
    "language": "english",
    "flash": 0,
    "numbers": "$contactNumber"
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return true;
  } else {
    print(response.reasonPhrase);
    return false;
  }
}
