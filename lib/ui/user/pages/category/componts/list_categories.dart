import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:provider/provider.dart';

import 'item_list_categories.dart';

class ListCategories extends StatelessWidget {


  var _fieldProvider;

  @override
  Widget build(BuildContext context) {
    if(_fieldProvider==null){
      _fieldProvider= Provider.of<FieldProvider>(context);
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: _fieldProvider.filds.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height / 800,
            crossAxisSpacing: .5,
            mainAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return ItemListCategories(fields[index]);
        },
      ),
    );
  }
}
