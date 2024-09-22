import 'package:firebase_crud/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({super.key});

  @override
  State<AddNameScreen> createState() => _AddNameScreenState();
}

class _AddNameScreenState extends State<AddNameScreen> {

  final TextEditingController _nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese un nuevo nombre.'
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                await addPeople(_nameController.text).then((_) {
                  if (mounted) Navigator.pop(context);
                });                
              }, 
            child: const Text('Guardar')
            )
          ],
        ),
      ),
    );
  }
}