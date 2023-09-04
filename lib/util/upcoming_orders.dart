import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpComingOrders extends StatefulWidget {
  const UpComingOrders(
      {Key? key,
      required this.quantity,
      required this.order,
      required this.roomNo,
      required this.officeNo,
      required this.employeeName})
      : super(key: key);
  final String? employeeName, officeNo, roomNo, order, quantity;
  @override
  State<UpComingOrders> createState() => _UpComingOrdersState();
}

class _UpComingOrdersState extends State<UpComingOrders> {
  String _selectedStatus = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.h),
          width: 350.w,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: const Color(0xFFC67C4E),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.employeeName ?? '',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: const Color(0xFFC67C4E)),
                  ),
                  Text(
                    'Office No: ' + widget.officeNo.toString(),
                    style: TextStyle(fontSize: 14.sp, fontFamily: 'Sora'),
                  ),
                  Text('Room No: ' + widget.roomNo.toString(),
                      style: TextStyle(fontSize: 14.sp, fontFamily: 'Sora')),
                  Text('Order: ' + widget.order.toString(),
                      style: TextStyle(fontSize: 14.sp, fontFamily: 'Sora')),
                  Text('Quantity: ' + widget.quantity.toString(),
                      style: TextStyle(fontSize: 14.sp, fontFamily: 'Sora')),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFC67C4E)),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: Color(0xFFC67C4E)),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(60, 60),
                  ),
                ),
                onPressed: () {
                  showStatusMenu();
                },
                child: Text(
                  _selectedStatus.isNotEmpty ? _selectedStatus : 'Status',
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    color: Color(0xFFC67C4E),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  void showStatusMenu() {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Accepted',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                'Accepted',
                style: TextStyle(
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Rejected',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.highlight_remove,
                color: Colors.yellow,
              ),
              SizedBox(width: 8),
              Text(
                'Rejected',
                style: TextStyle(
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Pending',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.error,
                color: Colors.orange,
              ),
              SizedBox(width: 8),
              Text(
                'Pending',
                style: TextStyle(
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Cancelled',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'Cancelled',
                style: TextStyle(
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
        ),
      ],
    ).then((selectedValue) {
      if (selectedValue != null) {
        setState(() {
          _selectedStatus = selectedValue;
        });
      }
    });
  }
}
