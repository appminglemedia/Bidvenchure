import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BiddingFormController extends GetxController {
  var selectedEventType = 'Select the Type of Event'.obs;
  var selectedDate = 'Select the Date of the Event'.obs;
  var selectedGuestCount = 'Number of Guests Expected'.obs;
  var selectedEventTiming = 'Event Timing'.obs;

  List<String> eventTypes = [
    'Wedding',
    'Birthday',
    'Conference',
    'Other',
  ];

  List<String> eventDates = [
    '10 Oct, 2024',
    '15 Oct, 2024',
    '20 Oct, 2024',
    '25 Oct, 2024',
  ];

  List<String> guestCounts = [
    '1-50',
    '50-100',
    '100-200',
    '200+',
  ];

  List<String> eventTimings = [
    'Morning',
    'Afternoon',
    'Evening',
    'Night',
  ];
}
