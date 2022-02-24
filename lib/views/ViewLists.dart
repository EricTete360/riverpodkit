import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodkit/view_models/ViewListControl.dart';


class ViewFulLists extends StatefulWidget {
  const ViewFulLists({ Key? key }) : super(key: key);

  @override
  _ViewFulListsState createState() => _ViewFulListsState();
}


class _ViewFulListsState extends State<ViewFulLists> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewLists(),
    );
  }
}


class ViewLists extends StatelessWidget {
  const ViewLists({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewConsumer(),
    );
  }
}

class ViewConsumer extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final mylist = ref.watch(viewListControl.notifier);
    print(mylist);
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: mylist.getAll().asStream(),
          builder: (context,AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemBuilder: (buildContext,index){
                  return ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].id.toString()),
                  );
                }
              );
            }
            else{
              return Text("Fetching");
            }
          } ,),
      ),
    );


    
  }

}
