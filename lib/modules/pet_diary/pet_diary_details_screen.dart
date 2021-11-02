import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_rescue/modules/pet_diary/pet_diary_controller.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class PetDiaryDetailsScreen extends StatelessWidget {
  final PetDiary diary;
  const PetDiaryDetailsScreen(this.diary, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          '${diary.name}\'s Diary',
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 1,
        ),
      ),
      body: ListView(
        children: [
          _buildContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Image.network(diary.imageUrl),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                        context,
                        title: 'Created date: ',
                        content: diary.updatedDate,
                      ),
                      const SizedBox(height: 3.0),
                      _buildText(
                        context,
                        title: 'Main activity: ',
                        content: diary.mainActivity,
                      ),
                      const SizedBox(height: 3.0),
                      _buildText(
                        context,
                        title: 'Health condition: ',
                        content: diary.healthCondition,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'More Details'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: ColorConstants.red,
                        fontSize: 20.0,
                      ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  diary.petDetails,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        height: 1.4,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          _buildContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Images'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: ColorConstants.red,
                        fontSize: 20.0,
                      ),
                ),
                const SizedBox(height: 5.0),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemCount: diary.images.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(diary.images[i]),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context,
      {required String title, required String content}) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline6,
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: ColorConstants.red,
            ),
          ),
          TextSpan(
              text: '\r\n$content',
              style: Theme.of(context).textTheme.headline5),
        ],
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 12.0,
      ),
      child: child,
    );
  }
}
