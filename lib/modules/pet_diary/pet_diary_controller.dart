import 'package:get/get.dart';

class PetDiary {
  String imageUrl;
  String name;
  String updatedDate;
  String mainActivity;
  String healthCondition;
  String petDetails;
  List<String> images;

  PetDiary({
    required this.imageUrl,
    required this.name,
    required this.updatedDate,
    required this.mainActivity,
    required this.healthCondition,
    required this.petDetails,
    required this.images,
  });
}

class PetDiaryController extends GetxController {
  List<PetDiary> petDiaries = [
    PetDiary(
      imageUrl: 'https://i.natgeofe'
          '.com/n/f0dccaca-174b-48a5-b944-9bcddf913645/01-cat'
          '-questions-nationalgeographic_1228126_4x3.jpg',
      name: 'Susu',
      updatedDate: '25/10/2021',
      mainActivity: 'Vaccine',
      healthCondition: 'Vomiting',
      petDetails:
          '- Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n'
          '- Sed condimentum lacus varius malesuada. Quisque lectus dui, '
          'vehicula non urna non\r\n'
          '- Phasellus dapibus ultricies turpis non dictum.\r\n'
          '- Nullam consequat nunc ut ante congue, sed lobortis lectus aliquam. Proin interdum leo nec blandit aliquet.',
      images: [
        'https://www.uniquelycats'
            '.com/wp-content/uploads/2018/07/AdobeStock_139614520-e1530736249795.jpeg',
        'https://www.petcity.vn/media/news/2909_meo-tam-the-2.jpg',
        'https://thucanh.vn/wp-content/uploads/2021/08/gia-meo-tam-the.jpg',
        'https://hoiyeumeo.vn/public/upload/600x300x2x100/5-su-that-thu-v%E1'
            '%BB%8B-ve-meo-tam-the5.jpeg',
      ],
    ),
    PetDiary(
      imageUrl: 'https://meowtel.com/img/assets/home/hero-image-cat-1.png',
      name: 'Tom',
      updatedDate: '24/10/2021',
      mainActivity: 'Dewormed',
      healthCondition: 'Healthy',
      petDetails:
          'Nulla condimentum risus ut tempus tristique. Proin sed vulputate enim. '
          'Donec tristique tincidunt est in ultricies. Nulla sed dapibus magna. Suspendisse velit odio, '
          'cursus eget elementum eget, facilisis in mi. In vitae faucibus ligula. Suspendisse eget mauris turpis. '
          'Nam eu sapien ullamcorper erat rhoncus condimentum a a risus. Morbi feugiat turpis sit amet urna gravida, '
          'a elementum leo congue. Curabitur lorem felis, aliquam et justo quis, porta suscipit orci. Integer hendrerit '
          'libero ut enim imperdiet tempor. Nulla facilisi. Phasellus finibus lacinia tellus, non mattis nisi pharetra a. '
          'Fusce enim tortor, iaculis a est porttitor, pulvinar condimentum'
          ' purus. Maecenas vel ligula urna.',
      images: [
        'https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg?cs=srgb&dl=pexels-wojciech-kumpicki-2071882.jpg&fm=jpg',
        'https://live.staticflickr.com/1261/1413379559_412a540d29_b.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCr62bk_qEPcy8oTeMt7LxNovIMkfLltW4A&usqp=CAU',
        'https://i.pinimg.com/736x/6c/6b/24/6c6b24cc13711c81b8195195207f1143--chats-tabby-tabby-cats.jpg',
      ],
    ),
    PetDiary(
      imageUrl: 'https://i.natgeofe'
          '.com/n/f0dccaca-174b-48a5-b944-9bcddf913645/01-cat'
          '-questions-nationalgeographic_1228126_4x3.jpg',
      name: 'Susu',
      updatedDate: '20/10/2021',
      mainActivity: 'Sterilization',
      healthCondition: 'Healthy',
      petDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Nullam sed lacus vel urna varius congue in eu nulla. Donec dui nulla, '
          'congue eu vestibulum a, hendrerit a eros. Donec aliquet ipsum lectus, blandit '
          'malesuada justo lobortis non. Sed et aliquet magna, id sollicitudin tortor. Orci '
          'varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. '
          'Quisque porta pharetra elit, quis placerat est. Etiam viverra porta erat. Ut non neque libero. '
          'Sed pellentesque mattis libero, et volutpat sem vulputate sed. Etiam bibendum diam quis urna dapibus '
          'consectetur. Maecenas viverra libero sed dignissim varius. Nam '
          'commodo consequat porta. Vestibulum ante ipsum.',
      images: [
        'https://www.uniquelycats'
            '.com/wp-content/uploads/2018/07/AdobeStock_139614520-e1530736249795.jpeg',
        'https://www.petcity.vn/media/news/2909_meo-tam-the-2.jpg',
        'https://thucanh.vn/wp-content/uploads/2021/08/gia-meo-tam-the.jpg',
        'https://hoiyeumeo.vn/public/upload/600x300x2x100/5-su-that-thu-v%E1'
            '%BB%8B-ve-meo-tam-the5.jpeg',
      ],
    ),
  ];
}
