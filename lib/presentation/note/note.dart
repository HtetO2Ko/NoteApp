import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/configs/theme/app_color.dart';
import 'package:note_app/core/navigation/app_navigation.dart';
import 'package:note_app/core/widgets/custom_appbar.dart';
import 'package:note_app/data/note/models/note.dart';
import 'package:note_app/presentation/note/add_note.dart';
import 'package:note_app/presentation/note/edit_note.dart';
import 'package:note_app/presentation/note/notifier/note_notifier.dart';
import 'package:provider/provider.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteNotifier(),
      child: Consumer<NoteNotifier>(
        builder: (context, notifier, child) {
          final theme = Theme.of(context);
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: CustomAppbar(
              hideBack: true,
              title: Text("Note"),
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: notifier.getNotes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No notes found!"));
                }

                // final notes = snapshot.data!.docs;
                final notes = snapshot.data!.docs.map((doc) {
                  return Note.fromMap(
                    doc.data() as Map<String, dynamic>,
                    doc.id,
                  );
                }).toList();

                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    var note = notes[index];
                    String formattedDate = DateFormat("dd/MM/yyyy")
                        .format(note.createdAt.toDate());
                    return GestureDetector(
                      onTap: () => AppNavigator.push(
                        context,
                        EditNote(editNote: note),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: TextStyle(
                                fontSize: 20,
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              note.description,
                              style: TextStyle(
                                fontSize: 18,
                                color: theme.primaryColor,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 3,
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: 15,
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: AppColor.buttonColor,
              onPressed: () => AppNavigator.push(
                context,
                AddNote(),
              ),
              child: Icon(
                Icons.add,
                color: theme.primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
