import 'package:flutter/material.dart';
import 'package:marham_softec/core/theme/app_colors.dart';
import 'package:marham_softec/core/widgets/custom_app_bar.dart';
import 'package:marham_softec/core/widgets/primary_button.dart';

class AddTaskThroughVoice extends StatefulWidget {
  const AddTaskThroughVoice({super.key});

  @override
  State<AddTaskThroughVoice> createState() => _AddTaskThroughVoiceState();
}

class _AddTaskThroughVoiceState extends State<AddTaskThroughVoice> {

    bool isRecording = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: CustomAppBar(title: 'Add Task - Voice'),
          body: Center(
            // child: Text(widget.data),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(125),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
                  child: CircleAvatar(
                    radius: 125,
                    backgroundColor: Colors.grey.shade300,
                    child: IconButton(
                      icon: Icon(
                        isRecording
                            ? Icons.stop_circle_outlined
                            : Icons.mic_none_outlined,
                        size: 120,
                        color: AppColors.backgroundDark,
                      ),
                      onPressed: () {
                        // TODO: Implement Voice Record Start/Stop functionality
                      },
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child: PrimaryButton(
                        text: 'Submit recording', onPressed: () {})),
                SizedBox(height: 54),
              ],
            ),
          ),
        );
  }
}