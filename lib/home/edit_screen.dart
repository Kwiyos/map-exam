import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../note.dart';
import 'bloc/home_bloc.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  final bool editable;

  const EditScreen({Key? key, this.note, this.editable = true}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title!;
      _descriptionController.text = widget.note!.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            centerTitle: true,
            title: const Text('App Bar Title'),
            actions: [
              if (widget.editable)
                IconButton(
                    icon: const Icon(
                      Icons.check_circle,
                      size: 30,
                    ),
                    onPressed: () {
                      context.read<HomeBloc>().add(onEditSubmitTap(Note(
                          title: _titleController.text.trim(),
                          content: _descriptionController.text.trim(),
                          id: widget.note?.id)));
                      Navigator.of(context).pop();
                    }),
              IconButton(
                  icon: const Icon(
                    Icons.cancel_sharp,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  initialValue: null,
                  enabled: widget.editable,
                  decoration: InputDecoration(hintText: 'Type the title here', border: widget.editable ? null : InputBorder.none),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TextFormField(
                      controller: _descriptionController,
                      enabled: widget.editable,
                      initialValue: null,
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        hintText: 'Type the description',
                      ),
                      onChanged: (value) {}),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
