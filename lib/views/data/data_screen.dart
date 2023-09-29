import 'package:fight_number/controller/import_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DataScreen extends StatelessWidget {
  final ImportDataController _controller = Get.put(ImportDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      // Set the background color to a slightly dark shade of grey
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.onCreateData();
              },
              child: Text('create data categories'),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _controller.status.clear();
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                  ),
                ),
                Container(
                  height: 40.h,
                  width: 100.w,
                  color: Colors.black54,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: _controller.status.length,
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, position) {
                        return Container(
                          width: 90.w,
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                          child: Text(
                            _controller.status[position],
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
