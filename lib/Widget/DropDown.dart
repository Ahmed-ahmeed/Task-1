import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryDropdown extends StatefulWidget {
  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String selectedCountry = 'Egypt'; // القيمة الافتراضية المختارة

  final Map<String, String> countryDialCodes = {
    'Egypt': '+20',
    'Russia': '+7',
  };
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCountry,
      onChanged: (String? newValue) {
        setState(() {
          selectedCountry = newValue!;
        });
      },
      items: <String>['Egypt', 'Russia']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              CountryFlags(value: value), // إضافة الأعلام هنا
              SizedBox(width: 10),
              Text(value),
              SizedBox(
                width: 10,
              ),
              Text(
                countryDialCodes[value]!,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        );
      }).toList(),
      icon: Icon(Icons.arrow_drop_down_outlined),
    );
  }
}

class CountryFlags extends StatelessWidget {
  final String value;

  const CountryFlags({required this.value});

  @override
  Widget build(BuildContext context) {
    String flagAsset = '';
    if (value == 'Egypt') {
      flagAsset = 'assets/images/svg/eg.svg'; // مسار SVG للعلم المصري
    } else if (value == 'Russia') {
      flagAsset = 'assets/images/svg/ru.svg'; // مسار SVG للعلم الروسي
    }

    return SizedBox(
      width: 30,
      height: 20,
      child: SvgPicture.asset(
        flagAsset,
        fit: BoxFit.cover,
      ),
    );
  }
}
