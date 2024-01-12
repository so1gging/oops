import 'package:flutter/material.dart';
import 'package:oops_flutter/controllers/word_list_controller.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({super.key});

  @override
  State<WordListPage> createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {
  late final WordListController _wordListController = WordListController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('어때요'),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: FutureBuilder(
          future: _wordListController.getWordListCount(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
            if (snapshot.hasData == false) {
              return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
            }

            //error가 발생하게 될 경우 반환하게 되는 부분
            else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                  style: TextStyle(fontSize: 15),
                ),
              );
            }

            // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
            else {
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 열의 수를 정의
                  crossAxisSpacing: 8.0, // 열 간의 간격
                  mainAxisSpacing: 8.0, // 행 간의 간격
                ),
                itemBuilder: (BuildContext context, int index) {
                  // 각 그리드 아이템의 빌드
                  return Container(
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        snapshot.data[index].title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
