import 'package:Hotelino/features/booking/presentation/booking_provider.dart';
import 'package:Hotelino/features/booking/presentation/widgets/booking_form_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/date_time_picker.dart';
import 'package:Hotelino/features/booking/presentation/widgets/number_text_field.dart';
import 'package:Hotelino/features/booking/presentation/widgets/terms_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(const Duration(milliseconds: 100));
    _formKey.currentState?.reset();
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
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookingFormField(
                      title: 'نام و نام خانوادگی',
                      hint: 'نام و نام خانوادگی خود را وارد کنید...',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا نام خود را کامل بنویسید';
                        }

                        return null;
                      },
                      initialValue: bookingProvider.booking.fullName,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setName(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    BookingFormField(
                      title: 'مقصد',
                      hint: 'مقصد خود را وارد کنید...',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا مقصد خود را مشخص کنید';
                        }

                        return null;
                      },
                      initialValue: bookingProvider.booking.destination,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setDestination(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    DatePickerField(
                      title: 'تاریخ اقامت',
                      hint: 'بازه زمانی اقامت را مشخص کنید',
                      initialValue: bookingProvider.booking.checkInOutRange,
                      validator: (value) {
                        if (value == null) {
                          return 'لطفاً بازه‌ی زمانی را انتخاب کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setRangeDate(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    BookingFormField(
                      title: 'تعداد نفرات',
                      hint: 'تعداد نفرات خود را وارد کنید...',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا تعداد نفرات را مشخص کنید';
                        }

                        return null;
                      },
                      initialValue: bookingProvider.booking.numberOfGuests,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setNumberOfGuests(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    NumberFormField(
                      initialValue: bookingProvider.booking.phoneNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا شماره را به درستی وارد کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setPhoneNumber(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    const TermsWidget(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'درخواست رزرو با موفقیت ثبت شد! 🎉',
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            );
                          }
                          ;
                        },
                        child: const Text("جستجو هتل ها"),
                      ),
                    ),
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
