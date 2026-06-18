// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hotelino/features/boking/logic/booking_provider.dart';
import 'package:hotelino/features/boking/presentation/widgets/booking_form_field.dart';
import 'package:hotelino/features/boking/presentation/widgets/date_picker_field.dart';
import 'package:hotelino/features/boking/presentation/widgets/number_text_field.dart';
import 'package:hotelino/features/boking/presentation/widgets/terms_widget.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  static GlobalKey<_BookingPageState> bookingPageKey =
      GlobalKey<_BookingPageState>();

  BookingPage({Key? key}) : super(key: bookingPageKey);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'فرم رزرو هتل',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookingFormField(
                      title: 'نام و نام خانوادگی ',
                      hint: 'نام و نام خانوادگی خود را وارد کنید ...',
                      initialValue: bookingProvider.booking.fullName,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا نام خود را کامل بنویسید';
                        }

                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setName(newValue);
                        }
                      },
                    ),

                    SizedBox(height: 8),

                    BookingFormField(
                      title: 'مقصد',
                      hint: 'مقصد خود را وارد کنید ...',
                      initialValue: bookingProvider.booking.destination,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا مقصد خود را مشخص کنید';
                        }

                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setDestination(newValue);
                        }
                      },
                    ),

                    SizedBox(height: 8),

                    DatePickerField(
                      title: 'تاریخ اقامت',
                      hint: 'بازه زمانی اقامت را مشخص کنید',
                      initialValue: bookingProvider.booking.checkInOutRangeDate,
                      validator: (value) {
                        if (value == null) {
                          return 'لطفا بازه زمانی را انتخاب کنید:';
                        }

                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setRangeDate(newValue);
                        }
                      },
                    ),

                    SizedBox(height: 8),

                    BookingFormField(
                      title: 'تعداد نفرات',
                      hint: 'تعداد نفرات خود را وارد کنید ...',
                      initialValue: bookingProvider.booking.numberOfGuests,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا تعداد نفرات خود را مشخص کنید';
                        }

                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setNumberOfGuestes(newValue);
                        }
                      },
                    ),

                    SizedBox(height: 8),

                    NumberFormField(
                      initialValue: bookingProvider.booking.phoneNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لظفا شماره را به درستی وارد کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setPhoneNumber(newValue);
                        }
                      },
                    ),
                    TermsWidget()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
