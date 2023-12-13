import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';

class PagingViewWidget extends StatefulWidget {
  const PagingViewWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagingViewWidgetState createState() => _PagingViewWidgetState();
}

class _PagingViewWidgetState extends State<PagingViewWidget> {
  int allPage = 10;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorDarkRed,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing 1 to 24 entries',
            style: Theme.of(context).textTheme.normal,
          ),
          _buildSectionPageNumber(),
        ],
      ),
    );
  }

  Widget _buildSectionPageNumber() {
    return Row(
      children: [
        _buildIconBackForward(const Icon(Icons.arrow_back_ios, size: 10)),
        const SizedBox(width: 10),
        Text(
          '1 2 ... 9 10',
          style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        _buildIconBackForward(const Icon(Icons.arrow_forward_ios, size: 10)),
      ],
    );
  }

  Widget _buildIconBackForward(Widget widget) {
    return Container(
      // padding: const EdgeInsets.only(left: 4),
      alignment: Alignment.center,
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white),
      ),
      child: widget,
    );
  }
}
