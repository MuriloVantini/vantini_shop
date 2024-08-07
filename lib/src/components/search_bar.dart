import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> with SingleTickerProviderStateMixin {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isActive) Text("Explore", style: textTheme.titleLarge),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: isActive
                  ? SizedBox(
                    height: 40,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Encontre um produto',
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isActive = false;
                                  });
                                },
                                icon: const Icon(Icons.close))),
                      ),
                  )
                  : IconButton(
                      onPressed: () {
                        setState(() => isActive = true);
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
