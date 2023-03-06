import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class HomeLoadingPage extends StatelessWidget {
  const HomeLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _padding = const EdgeInsets.fromLTRB(16, 32, 16, 16);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: _padding,
            child: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 32),
            ),
          ),
          Padding(
            padding: _padding,
            child: const Text('Tasks',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SkeletonItem(
                            child: Stack(children: [
                              SkeletonParagraph(
                                  style: SkeletonParagraphStyle(
                                      lines: 3,
                                      spacing: 6,
                                      lineStyle: SkeletonLineStyle(
                                        randomLength: true,
                                        height: 10,
                                        borderRadius: BorderRadius.circular(8),
                                        minLength:
                                            MediaQuery.of(context).size.width /
                                                2,
                                      ))),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    shape: const CircleBorder(),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: _padding,
            child: const Text('Your Garden',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SkeletonItem(
                            child: Stack(children: [
                              SkeletonParagraph(
                                  style: SkeletonParagraphStyle(
                                      lines: 3,
                                      spacing: 6,
                                      lineStyle: SkeletonLineStyle(
                                        randomLength: true,
                                        height: 10,
                                        borderRadius: BorderRadius.circular(8),
                                        minLength:
                                            MediaQuery.of(context).size.width /
                                                2,
                                      ))),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    shape: const CircleBorder(),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
