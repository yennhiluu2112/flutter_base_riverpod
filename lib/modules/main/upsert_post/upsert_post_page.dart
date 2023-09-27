import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/widgets/label.dart';
import 'package:flutter_base_riverpod/modules/main/upsert_post/widgets/image_picker_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

@RoutePage()
class UpsertPostPage extends StatefulWidget {
  const UpsertPostPage({super.key});

  @override
  State<UpsertPostPage> createState() => _UpsertPostPageState();
}

class _UpsertPostPageState extends State<UpsertPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upsert Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FormBuilder(
                child: ListView(
                  children: [
                    const Label('Title'),
                    FormBuilderTextField(name: 'title'),
                    const Label('Content'),
                    FormBuilderTextField(name: 'content'),
                    const Label('Image'),
                    FormBuilderField<String>(
                      builder: (field) {
                        return ImagePickerField(
                          didChangeField: (value) {
                            field.didChange(value);
                          },
                          field: field,
                        );
                      },
                      name: 'imageUrl',
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Upsert Post'),
            ),
          ],
        ),
      ),
    );
  }
}
