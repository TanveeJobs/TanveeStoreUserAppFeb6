import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  int count;
  ValueChanged<int> countChanged;

  CounterWidget({
    required this.count,
    required this.countChanged,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    // return Text("Hello");
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        widget.count > 0
            ? Container(
                // color: Colors.red,
                padding: EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        widget.count--;
                        widget.countChanged(widget.count);
                        setState(() {});
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 1))
                            ]),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14,
                          child: const Icon(Icons.remove, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      // widget.itemMap['selectedQuantity'].toString(),
                      widget.count.toString(),
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        widget.count++;
                        widget.countChanged(widget.count);
                        setState(() {});
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 1))
                            ]),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14,
                          child: const Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  widget.count++;
                  widget.countChanged(widget.count);
                  if(mounted)
                  setState(() {});
                },
                child: Text("Add"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
              )
      ],
    );
  }
}
