import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/register_provider.dart';

class RegisterTile extends StatelessWidget {
  const RegisterTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     title: const Text("Register List")
        // ),
        body: Center(
          child: Column(
            children: [
              //Text("test"),
              RegisterView(),
            ],
          ),
        ),
      )
    );
  }
}

class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final lstRegister = ref.watch(registerList);

    return lstRegister.when(
        data: (root) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.refresh(registerList);
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: root.length, // Assuming 'root' is a List of items
                itemBuilder: (BuildContext context, int index) {
                  final item = root[index]; // Get the item at the current index
                  return ListTile(
                    //title: Text("Register Code: ${item.name ?? 'N/A'}"),
                    title: Text("Register Code: ${item.value?.ownerName ?? 'Hello'}"),
                    //title: Text("Register Code: ${item?.bdm ?? 'N/A'}"),
                    // Add more ListTiles for other properties here
                  );
                },
              ),
            ),
          );
        },
        // data: (root) {
        //   final List<Map<String, dynamic>> items = root['value']; // Extract the list of items from 'value'
        //   return Expanded(
        //     child: RefreshIndicator(
        //       onRefresh: () async {
        //         ref.refresh(registerList);
        //       },
        //       child: ListView.builder(
        //         physics: const AlwaysScrollableScrollPhysics(),
        //         itemCount: items.length, // Number of items in the list
        //         itemBuilder: (BuildContext context, int index) {
        //           final item = items[index]; // Get the item at the current index
        //           return ListTile(
        //             title: Text("Register Code: ${item['registerCode'] ?? 'N/A'}"),
        //             // You can add more ListTile widgets for other properties here
        //           );
        //         },
        //       ),
        //     ),
        //   );
        // },
        loading: () => const Center(child: CircularProgressIndicator(),),
        error: (err, stack) => Text('Error $err')
    );
  }
}

