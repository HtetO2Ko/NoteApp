import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_appbar.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/data/note/models/note.dart';
import 'package:note_app/presentation/note/notifier/edit_note_notifier.dart';
import 'package:provider/provider.dart';

class EditNote extends StatelessWidget {
  final Note editNote;
  const EditNote({
    super.key,
    required this.editNote,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditNoteNotifier()..bindEditNote(editNote),
      child: Consumer<EditNoteNotifier>(
        builder: (context, notifier, child) {
          final theme = Theme.of(context);
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: CustomAppbar(
              title: Text("Edit Note"),
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

  Widget _titleTextField(EditNoteNotifier notifier) {
    return TextField(
      controller: notifier.titleCtr,
      decoration: InputDecoration(labelText: "Title"),
    );
  }

  Widget _descTextField(EditNoteNotifier notifier) {
    return TextField(
      controller: notifier.descCtr,
      decoration: InputDecoration(labelText: "Description"),
      maxLines: 3,
    );
  }

  Widget _saveNote(BuildContext context, EditNoteNotifier notifier) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onTap: () => notifier.deleteNote(context),
            buttonTxt: "Delete",
            buttonLoading: notifier.isDeleteLoading,
            color: Colors.red,
            txtColor: Colors.white,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomButton(
            onTap: () => notifier.saveNote(context),
            buttonTxt: "Save",
            buttonLoading: notifier.isLoading,
          ),
        ),
      ],
    );
  }

  Widget _spacing() {
    return SizedBox(
      height: 20,
    );
  }
}
