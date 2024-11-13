import 'package:flutter/material.dart';
import 'package:notes/features/Home/presentation/widgets/custom_shearch_delegate.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () async {
          final value = await showSearch(
              context: context,
              delegate: CustomSearchDelegate(['ahmed', 'ali']));
   
        },
        child: const Icon(
          Icons.search,
          size: 30,
        ),
      ),
    );
  }
}
