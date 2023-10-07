import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownselectname;
  final TextEditingController dropdownselectid;

  const CustomDropdownSearch(
      {Key? key,
      this.title,
      required this.listdata,
      required this.dropdownselectname,
      required this.dropdownselectid})
      : super(key: key);

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  void showDropdownSearch() {
    DropDownState(
      DropDown(
          bottomSheetTitle: Text(
            widget.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          data: widget.listdata,
          selectedItems: (List<dynamic> selectedList) {
            SelectedListItem selectedListItem = selectedList[0];

            widget.dropdownselectname.text = selectedListItem.name;
            widget.dropdownselectid.text = selectedListItem.value!;
            print("========================");
            print(widget.dropdownselectid.text);
            print(widget.dropdownselectname.text);
            print("========================");
          }),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownselectname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropdownSearch();
      },
      decoration: InputDecoration(
          hintText: widget.dropdownselectname.text == ""
              ? widget.title
              : widget.dropdownselectname.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(widget.dropdownselectname.text == ""
                  ? widget.title!
                  : widget.dropdownselectname.text)),
          suffixIcon:
              InkWell(child: const Icon(Icons.arrow_drop_down), onTap: () {}),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
