
import 'package:contactlist_app/models/contact_list_data.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<ContactListData> contactListData = [];

  // add contact function
  void _addContact(String Name, String Number) {
    ContactListData contactListDataItem =
    ContactListData(name: Name, number: Number);
    contactListData.add(contactListDataItem);
    setState(() {});
  }

  // deleted contact function
  void _deleteContact(int index) {
    contactListData.removeAt(index);
    setState(() {});
  }

  // Function to delete a tile after confirmation
  void _removeItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Are you sure you for delete?'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.no_sim_outlined,
              color: Colors.blue,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {
              _deleteContact(index);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.blue,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildForm(),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemCount: contactListData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.white,
                    child: InkWell(
                      onLongPress: () {
                        _removeItem(index);
                      },
                      child: ListTile(
                        leading: const Icon(
                          Icons.person,
                          size: 32,
                          color: Color(0xFF8E3E63),
                        ),
                        title: Text(
                          contactListData[index].name,
                          style: const TextStyle(color: Colors.red),
                        ),
                        subtitle: Text(contactListData[index].number),
                        trailing: const Icon(
                          Icons.phone,
                          color: Colors.blue,
                          size: 25,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        tileColor: Colors.grey.shade300,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameTEController,
              keyboardType: TextInputType.text,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return "Enter the Name";
                }
                return null;
              },
            ),

            const SizedBox(height: 10),

            TextFormField(
                controller: _numberTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Number",
                ),
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }

                  if (!RegExp(r'^(\+)|\d{11}$').hasMatch(value)) {
                    return 'Enter a valid phone number.';
                  }
                  return null;
                }
            ),


            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addContact(_nameTEController.text, _numberTEController.text);
                }
                _nameTEController.clear();
                _numberTEController.clear();
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _numberTEController.dispose();
    super.dispose();
  }
}
