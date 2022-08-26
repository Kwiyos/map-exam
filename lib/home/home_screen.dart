import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_exam/home/edit_screen.dart';
import 'package:map_exam/note.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const HomeScreen());

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Notes'),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade200,
                child: Text(
                  (state is HomeLoaded) ? state.noteList.length.toString() : '0',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: ListView.separated(
            itemCount: (state is HomeLoaded) ? state.noteList.length : 0,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (context, index) => ListTile(
              trailing: index == (state as HomeLoaded).showEditToolIndex
                  ? SizedBox(
                      width: 110.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              context.read<HomeBloc>().add(const onEditNoteTap());
                              Navigator.push(context, MaterialPageRoute(builder: (_context) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<HomeBloc>(context),
                                  child: EditScreen(
                                    note: state.noteList[index],
                                  ),
                                );
                              }));
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                            onPressed: () => context.read<HomeBloc>().add(onDeleteTap(state.noteList[index])),
                          ),
                        ],
                      ),
                    )
                  : null,
              title: Text(state.noteList[index].title ?? 'null'),
              subtitle: state.showLess ? null : Text(state.noteList[index].content ?? 'null'),
              onTap: () {
                context.read<HomeBloc>().add(const onViewNoteTap());
                Navigator.push(context, MaterialPageRoute(builder: (_context) {
                  return BlocProvider.value(
                    value: BlocProvider.of<HomeBloc>(context),
                    child: EditScreen(
                      note: state.noteList[index],
                    ),
                  );
                }));
              },
              onLongPress: () => context.read<HomeBloc>().add(onTitleLongPress(index)),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  heroTag: 'showButton',
                  child: (state is HomeLoaded && state.showLess) ? const Icon(Icons.menu) : const Icon(Icons.unfold_less),
                  tooltip:
                      (state is HomeLoaded && state.showLess) ? 'Show more. Show notes content' : 'Show less. Hide notes content',
                  onPressed: () => context.read<HomeBloc>().add(onShowButtonTap())),

              /* Notes: for the "Show More" icon use: Icons.menu */

              FloatingActionButton(
                heroTag: 'addButton',
                child: const Icon(Icons.add),
                tooltip: 'Add a new note',
                onPressed: () {
                  context.read<HomeBloc>().add(const onAddNoteTap());
                  Navigator.push(context, MaterialPageRoute(builder: (_context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: const EditScreen(),
                    );
                  }));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(onInitialize());
  }
}
