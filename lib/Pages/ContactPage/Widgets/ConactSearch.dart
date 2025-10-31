import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => {
                          print(value),
                        },
                        decoration: InputDecoration(
                          hintText: "Search contact",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ));
  }
}