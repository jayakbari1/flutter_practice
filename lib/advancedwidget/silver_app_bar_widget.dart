import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  List<Widget> _getItems() {
    List<Card> _cards = [];
    for (int i = 1; i <= 50; i++) {
      _cards.add(Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text('items: $i'),
        ),
      ));
    }
    return _cards;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.tealAccent, primarySwatch: Colors.deepPurple),
      child: Scaffold(
        body: CustomScrollView(
          //physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              //title: Text("SliverAppBar Widget",style: TextStyle(color: Theme.of(context).primaryColor),),
              centerTitle: true,
              //collapsedHeight: 100,
              expandedHeight: 150,

              //If we give it false then Appbar show whenever we reached at the top
              floating: false,
              pinned: false,
              //snap: false,
              // bottom: PreferredSize(preferredSize: Size.fromHeight(75),child: Text(""),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text('Animated AppBar'),
                background: Image.network(
                  'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.pin,
              ),
            ),
            // SliverList(delegate: SliverChildListDelegate(_getItems())),
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'The Increment Value is:',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '10',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
