import 'package:flutter/material.dart';
import 'package:loung_bar/ui/components/drawer.dart';
import 'package:loung_bar/ui/components/home_page_container_info.dart';
import 'package:loung_bar/ui/components/list_image.dart';
import 'package:loung_bar/ui/components/preview_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Превью
            const PreviewWidget(),
            const SizedBox(
              height: 10,
            ),
            //Основная информация
            const HomePageContainerInfo(),
            const SizedBox(
              height: 10,
            ),
            //Фотографии
            ListImage(
              isMobileUi: MediaQuery.of(context).size.width < 600,
            )
          ],
        ),
      ),
    );
  }
}
