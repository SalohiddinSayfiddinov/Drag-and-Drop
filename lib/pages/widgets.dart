import 'package:flutter/material.dart';

enum NoteStatus { newStatus, onProgress, done }

enum NoteState { easy, middle, urgent }

class NotesContainer extends StatelessWidget {
  const NotesContainer({
    super.key,
    required this.state,
    required this.index,
  });

  final NoteState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ID $index"),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: setStateColor(state).withOpacity(0.2),
                ),
                child: Text(
                  _stateToString(state),
                  style: TextStyle(
                    color: setStateColor(state),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(
            height: 100,
            child: Center(
              child: Text("IMAGE"),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Сделать новый сайт",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 30,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: const Text(
                    "#UI",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: List.generate(
                      3,
                      (index) {
                        const double overlap = 15.0;
                        final double leftPosition = index * overlap;

                        return Positioned(
                          left: leftPosition,
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.link,
                            color: Colors.grey,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.sms,
                            color: Colors.grey,
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                          Text(
                            "10.11.2023",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.status,
    required this.count,
  });
  final NoteStatus status;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  width: 10,
                  color: setStatusColor(status),
                ),
              ),
              Text(_statusToString(status)),
            ],
          ),
          Text(count.toString()),
        ],
      ),
    );
  }
}

String _statusToString(NoteStatus status) {
  switch (status) {
    case NoteStatus.newStatus:
      return 'New';
    case NoteStatus.onProgress:
      return 'On Progress';
    case NoteStatus.done:
      return 'Done';
  }
}

Color setStatusColor(status) {
  Color color = Colors.blue;
  switch (status) {
    case NoteStatus.newStatus:
      color = Colors.blue;
    case NoteStatus.onProgress:
      color = Colors.orange;
    case NoteStatus.done:
      color = Colors.greenAccent;
  }
  return color;
}

Color setStateColor(state) {
  Color color = Colors.blue;
  switch (state) {
    case NoteState.easy:
      color = Colors.greenAccent;
    case NoteState.urgent:
      color = Colors.red;
    case NoteState.middle:
      color = Colors.orange;
  }
  return color;
}

String _stateToString(NoteState state) {
  switch (state) {
    case NoteState.easy:
      return 'Easy';
    case NoteState.middle:
      return 'Middle';
    case NoteState.urgent:
      return 'Urgent';
  }
}
