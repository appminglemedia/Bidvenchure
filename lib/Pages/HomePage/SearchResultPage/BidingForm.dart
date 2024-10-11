import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:bidvenchure_user/Controller/BidFormController.dart';

class BidingForm extends StatelessWidget {
  final BiddingFormController controller = Get.put(BiddingFormController());

  BidingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bidding Form",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "Provide details to get accurate bids for your event.",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),

              // Dropdown for Event Type
              buildDropdown(
                "Select the Type of Event",
                controller.eventTypes,
                controller.selectedEventType,
              ),

              // Dropdown for Event Date
              const SizedBox(height: 16),
              buildDropdown(
                "Select the Date of the Event",
                controller.eventDates,
                controller.selectedDate,
              ),

              // Dropdown for Guest Count
              const SizedBox(height: 16),
              buildDropdown(
                "Number of Guests Expected",
                controller.guestCounts,
                controller.selectedGuestCount,
              ),

              // Dropdown for Event Timing
              const SizedBox(height: 16),
              buildDropdown(
                "Event Timing",
                controller.eventTimings,
                controller.selectedEventTiming,
              ),

              // Text Field for Budget Per Guest
              const SizedBox(height: 16),
              buildTextField("Budget per Guest", TextInputType.number),

              // Text Field for Preferred Location
              const SizedBox(height: 16),
              buildTextField("Preferred Location", TextInputType.text),

              // Text Field for Event Description
              const SizedBox(height: 16),
              buildTextField("Event Description", TextInputType.multiline,
                  maxLines: 4),

              // Submit Button
              const SizedBox(height: 24),
              Container(
                height: 46,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appColor, borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "Submit Your Bid",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown Builder
  Widget buildDropdown(String hint, List<String> items, RxString selectedItem) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xffE4DFDF),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xffE4DFDF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: appColor),
          ),
        ),
        value: selectedItem.value != hint ? selectedItem.value : null,
        hint: Text(
          hint,
          style: const TextStyle(color: appColor),
        ),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: blackColor),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          selectedItem.value = newValue!;
        },
      );
    });
  }

  // TextField Builder
  Widget buildTextField(String hintText, TextInputType inputType,
      {int maxLines = 1}) {
    return TextFormField(
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: appColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffE4DFDF),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: appColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffE4DFDF),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
