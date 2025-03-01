import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_appbar.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/presentation/note/notifier/add_note_notifier.dart';
import 'package:provider/provider.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddNoteNotifier(),
      child: Consumer<AddNoteNotifier>(
        builder: (context, notifier, child) {
          final theme = Theme.of(context);
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: CustomAppbar(
              title: Text("Add Note"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _titleTextField(notifier),
                  _spacing(),
                  _descTextField(notifier),
                  _spacing(),
                  _saveNote(context, notifier),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _titleTextField(AddNoteNotifier notifier) {
    return TextField(
      controller: notifier.titleCtr,
      decoration: InputDecoration(labelText: "Title"),
    );
  }

  Widget _descTextField(AddNoteNotifier notifier) {
    return TextField(
      controller: notifier.descCtr,
      decoration: InputDecoration(labelText: "Description"),
      maxLines: 3,
    );
  }

  Widget _saveNote(BuildContext context, AddNoteNotifier notifier) {
    return CustomButton(
      onTap: () => notifier.saveNote(context),
      buttonTxt: "Save",
      buttonLoading: notifier.isLoading,
    );
  }

  Widget _spacing() {
    return SizedBox(
      height: 20,
    );
  }
}
