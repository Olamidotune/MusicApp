import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  const Textformfield({
    Key? key,
    required TextEditingController homescreentextformcontroller,
  })  : _homescreentextformcontroller = homescreentextformcontroller,
        super(key: key);

  final TextEditingController _homescreentextformcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.name,
      controller: _homescreentextformcontroller,
      decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
              ),
    );
  }
}
