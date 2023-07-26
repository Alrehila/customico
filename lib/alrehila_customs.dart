// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api

library alrehila_customs;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      // ignore: deprecated_member_use
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  final String text;
  final String stext;
  final bool initialValue;
  final bool value;
  final void Function(bool?)? onChanged;
  final String? Function(bool?)? valid;
  final void Function()? onTap;

  const CustomCheckbox({
    Key? key,
    required this.text,
    required this.stext,
    required this.initialValue,
    required this.value,
    required this.onChanged,
    required this.valid,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      FormField<bool>(
                        initialValue: widget.initialValue,
                        validator: widget.valid,
                        builder: (state) {
                          return Checkbox(
                            value: widget.value,
                            onChanged: widget.onChanged,
                          );
                        },
                      ),
                      Text(widget.text),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          widget.stext,
                          style: const TextStyle(
                            fontSize: 11,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final state = context
                          .findAncestorStateOfType<FormFieldState<bool>>();
                      if (state?.errorText != null) {
                        return Text(
                          state!.errorText!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomEmailForm extends StatefulWidget {
  const CustomEmailForm({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    this.mycontroller,
    required this.valid,
    required this.isNumber,
    required this.obscureText,
    this.onTapIcon,
    required Null Function(dynamic value) onSaved,
  });

  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final void Function()? onTapIcon;

  @override
  State<CustomEmailForm> createState() => _CustomEmailForm();

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        obscureText: obscureText == null || obscureText == false ? false : true,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 9,
            ),
            child: Text(
              labeltext,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomEmailForm extends State<CustomEmailForm> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
    );
  }
}

class CustomPasswordForm extends StatefulWidget {
  const CustomPasswordForm({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    this.mycontroller,
    required this.valid,
    required this.isNumber,
    required this.obscureText,
    this.onTapIcon,
    required Null Function(dynamic value) onSaved,
  });

  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final void Function()? onTapIcon;

  @override
  State<CustomPasswordForm> createState() => _CustomPasswordForm();

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        obscureText: obscureText == null || obscureText == false ? false : true,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 9,
            ),
            child: Text(
              labeltext,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomPasswordForm extends State<CustomPasswordForm> {
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
    );
  }
}

class CountryCodes {
  final String name;
  final String code;
  final String flagImagePath;

  CountryCodes({
    required this.name,
    required this.code,
    required this.flagImagePath,
  });
}

class CountryListController extends GetxController {
  final List<CountryCodes> countries = [
    CountryCodes(
      name: 'United States',
      code: '+1',
      flagImagePath: 'assets/countries/us.jpg',
    ),
    CountryCodes(
      name: 'India',
      code: '+91',
      flagImagePath: 'assets/countries/in.png',
    ),
    CountryCodes(
      name: 'Egypt',
      code: '+20',
      flagImagePath: 'assets/countries/eg.jpg',
    ),
    CountryCodes(
      name: 'Algeria',
      code: '+213',
      flagImagePath: 'assets/countries/ae.jpg',
    ),
    CountryCodes(
      name: 'Saudi Arabia',
      code: '+966',
      flagImagePath: 'assets/countries/sa.jpg',
    ),
    CountryCodes(
      name: 'Iraq',
      code: '+964',
      flagImagePath: 'assets/countries/iz.jpg',
    ),
    CountryCodes(
      name: 'Yemen',
      code: '+967',
      flagImagePath: 'assets/countries/ym.jpg',
    ),
    CountryCodes(
      name: 'Syria',
      code: '+963',
      flagImagePath: 'assets/countries/sy.jpg',
    ),
    CountryCodes(
      name: 'Jordan',
      code: '+962',
      flagImagePath: 'assets/countries/jo.jpg',
    ),
    CountryCodes(
      name: 'Lebanon',
      code: '+961',
      flagImagePath: 'assets/countries/le.jpg',
    ),
    CountryCodes(
      name: 'United Arab Emirates',
      code: '+971',
      flagImagePath: 'assets/countries/ae.jpg',
    ),
    CountryCodes(
      name: 'Oman',
      code: '+968',
      flagImagePath: 'assets/countries/om.jpg',
    ),
    CountryCodes(
      name: 'Qatar',
      code: '+974',
      flagImagePath: 'assets/countries/qa.jpg',
    ),
    CountryCodes(
      name: 'Kuwait',
      code: '+965',
      flagImagePath: 'assets/countries/ku.jpg',
    ),
    CountryCodes(
      name: 'Libya',
      code: '+218',
      flagImagePath: 'assets/countries/ly.jpg',
    ),
    CountryCodes(
      name: 'Morocco',
      code: '+212',
      flagImagePath: 'assets/countries/mo.jpg',
    ),
    CountryCodes(
      name: 'Somalia',
      code: '+252',
      flagImagePath: 'assets/countries/so.jpg',
    ),
    CountryCodes(
      name: 'Tunisia',
      code: '+216',
      flagImagePath: 'assets/countries/ts.jpg',
    ),
    CountryCodes(
      name: 'Sudan',
      code: '+249',
      flagImagePath: 'assets/countries/su.jpg',
    ),
    CountryCodes(
      name: 'Bahrain',
      code: '+973',
      flagImagePath: 'assets/countries/ba.jpg',
    ),
  ];

  String selectedCountryCode = '';

  @override
  void onInit() {
    selectedCountryCode = countries[0].code;
    super.onInit();
  }

}

class CustomPhoneForm extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData iconData;
  final Widget prefixWidget;
  final TextEditingController? mycontroller;
  final void Function(String)? onCountryChanged;
  final String? Function(String?) valid;
  final void Function()? onTapIcon;

  const CustomPhoneForm({
    Key? key,
    this.onTapIcon,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.prefixWidget,
    required this.onCountryChanged,
    required this.valid,
    required this.mycontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountryListController countryListController =
        Get.find<CountryListController>();
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(0, 0, 0, 0),
                    items: countryListController.countries
                        .map((CountryCodes country) {
                      return PopupMenuItem<String>(
                        value: country.code,
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              country.flagImagePath,
                              width: 24,
                              height: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(country.name),
                          ],
                        ),
                      );
                    }).toList(),
                  ).then((value) {
                    if (value != null) {
                      countryListController.selectedCountryCode = value;
                      onCountryChanged?.call(value);
                    }
                  });
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      countryListController.countries
                          .firstWhere((country) =>
                              country.code ==
                              countryListController.selectedCountryCode)
                          .flagImagePath,
                      width: 24,
                      height: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(countryListController.selectedCountryCode),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          hintText: hinttext,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 9,
            ),
            child: Text(
              labeltext,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextAppBar extends StatelessWidget {
  final String text;
  final Color color;
  const CustomTextAppBar({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontFamily: 'Nunito',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomTextBody extends StatelessWidget {
  final String text;
  const CustomTextBody({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  final void Function()? onTapIcon;

  const CustomTextForm({
    Key? key,
    this.onTapIcon,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.valid,
    required this.mycontroller,
    required this.isNumber,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        obscureText: obscureText == null || obscureText == false ? false : true,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          hintText: hinttext,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 9,
            ),
            child: Text(
              labeltext,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  final Color color;
  const CustomTextSignUpOrSignIn({
    Key? key,
    required this.textone,
    required this.texttwo,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class CustomTextTitle extends StatelessWidget {
  final String text;
  const CustomTextTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 35, fontFamily: "Nunito"),
      ),
    );
  }
}
