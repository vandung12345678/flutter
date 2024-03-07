import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nguyễn Văn Dũng'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController txtController = TextEditingController();
  String opp_1571020041 = ""; //mã sinh viên
  double soA = 0, soB = 0;
  void btnClicked(String btnText) {
    // Lấy giá trị hiện tại từ TextField
    String txt = txtController.text;
    String result = "";

    if (btnText == "C") {
      // Xóa toàn bộ nội dung
      txt = "";
      soA = 0;
      soB = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      // Xác định toán tử và số đầu tiên (nếu có)
      soA = double.parse(txt);
      txt = "";
      opp_1571020041 = btnText; 
    } else if (btnText == "=") {
      // Tính kết quả dựa trên toán tử và số thứ hai
      soB = double.parse(txt);
      if (opp_1571020041 == "+") {
        result = (soA + soB).toString();
      } else if (opp_1571020041 == "-") {
        result = (soA - soB).toString();
      } else if (opp_1571020041== "x") {
        result = (soA * soB).toString();
      } else if (opp_1571020041 == "/") {
        result = (soA ~/ soB).toString();
      }
      txt = result;
    } else if (btnText == ".") {
      if (!txt.contains(".")) {
        // Đảm bảo chỉ có một dấu phẩy được thêm vào
        txt += ".";
      }
    } else if (btnText == "1/x") {
      // Tính nghịch đảo số
      soA = double.parse(txt);
      if (soA != 0) {
        result = (1 / soA).toString();
      } else {
        result = "Error"; // Xử lý trường hợp chia cho 0
      }
      txt = result;
    } else if (btnText == "X^2") {
      // Tính bình phương
      soA = double.parse(txt);
      result = (soA * soA).toString();
      txt = result;
    } else if (btnText == "%") {
      // Tính phần trăm
      soA = double.parse(txt);
      result = (soA / 100).toString();
      txt = result;
    } else if (btnText == "Del") {
      // Xóa ký tự cuối cùng
      if (txt.isNotEmpty) {
        txt = txt.substring(0, txt.length - 1);
      }
    } else if (btnText == "+/-") {
      // Chuyển đổi dấu số
      if (txt.startsWith("-")) {
        txt = txt.substring(1); // Loại bỏ dấu trừ nếu đã có
      } else {
        txt = "-$txt"; // Thêm dấu trừ nếu chưa có
      }
    } else if (btnText == "√") {
      // Tính căn bậc hai
      soA = double.parse(txt);
      result = (sqrt(soA)).toString();
      txt = result;
    } else {
      // Thêm chữ số hoặc dấu chấm vào TextField
      txt += btnText;
    }

    // Cập nhật giá trị mới cho TextField
    setState(() {
      txtController.text = txt;
    });
  }

  Widget customOutlineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 106, 21, 21),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: txtController,
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customOutlineButton("%"),
                customOutlineButton("CE"),
                customOutlineButton("C"),
                customOutlineButton("Del"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("1/x"),
                customOutlineButton("X^2"),
                customOutlineButton("√"),
                customOutlineButton("/"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("x"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("+/-"),
                customOutlineButton("0"),
                customOutlineButton("."),
                customOutlineButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}