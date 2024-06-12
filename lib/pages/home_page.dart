import 'package:espaco_cultural_2/components/custom_drawer.dart';
import 'package:espaco_cultural_2/components/exposicao.dart';
import 'package:flutter/material.dart';
import 'package:espaco_cultural_2/components/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String descricao1 =
        'Paulo Miyada e Tiago Gualberto são os curadores da exposição “Centelhas em Movimento”, com obras da Coleção Igor Queiroz Barroso. Após bem-sucedida temporada no Instituto Tomie Ohtake, em São Paulo, a mostra chega à Fortaleza, terra natal do colecionador. A abertura da exposição acontecerá no dia 12 de março, às 19h, no Espaço Cultural Unifor. A partir de 13 de março a exposição será aberta ao público, com visitação gratuita, de terças a sextas, das 9h às 19h e, aos sábados e domingos, das 12h às 18h. Na manhã do dia 13, às 9h30, os curadores vão ministrar palestra sobre a mostra no Núcleo Diálogos, também situado no Espaço Cultural Unifor. A mostra conta com cerca de 190 obras de autoria de mais de 55 artistas, abrangendo o período dos anos 1910 aos dias atuais, com foco especial na arte moderna brasileira. Assim, com a expografia e a montagem, os curadores buscam intensificar atritos e ressonâncias ao colocar lado a lado obras de distintos artistas, de momentos e contextos diferentes. “Os curadores conceberam uma montagem que destaca não apenas as singularidades de cada obra, mas também os diálogos e contrapontos entre elas. Por meio de narrativa visual que desafia a linearidade histórica, a exposição proporciona enigmas que instigam reflexões sobre o caráter ambivalente do modernismo, que desencadeia uma tensão produtiva, calor que pode gerar centelhas, convocando os visitantes a mergulharem em um universo de múltiplos significados”, afirma Lenise Queiroz Rocha, presidente da Fundação Edson Queiroz, mantenedora da Universidade de Fortaleza. Ao abrir mão do aspecto cronológico ou da segmentação por autoria na montagem da exposição, Tiago Gualberto destaca que os visitantes presentes no espaço expositivo são convidados a participar criativamente no tecimento de associações poéticas ao se depararem com espelhamentos entre obras em diferentes salas, por exemplo, ou por meio da articulação de conjuntos híbridos no espaço durante os percursos. “Isso certamente tornará a visita à exposição uma oportunidade de deflagrar nuances ou agitadas centelhas resultantes desses oportunos encontros”, acrescenta. Para Paulo Miyada, além de propor diálogos e enigmas, a narrativa não-linear da mostra evidencia que é o movimento que possibilita novas perspectivas e compreensões. O curador explica que o que está em jogo na exposição e em seu título é justamente a retomada do entendimento mais prosaico e intuitivo do movimento: deslocamento, em quaisquer direções e sentidos.';
    String descricao2 =
        'A Universidade de Fortaleza – instituição da Fundação Edson Queiroz – apresenta, no próximo dia 12 de março, a partir de 19h, a abertura das exposições “Fabricando Elefantes Todos os Dias”, de Claudio Cesar, e “Colecionando Afetos”, de Totonho Laprovitera. As mostras levam a chancela do projeto Trajetórias Artísticas Unifor, que apresenta exposições de artistas cearenses nas galerias térreas do Espaço Cultural Unifor. As mostras têm curadoria da artista plástica e arquiteta Andréa Dall’Olio Hiluy e estarão abertas para visitação gratuita a partir de 13 de março, de terças a sextas, das 9h às 19h e, sábados e domingos, das 12h às 18h. “O Trajetórias Artísticas Unifor é uma celebração do talento local, e escolhemos Totonho Laprovitera e Claudio Cesar para inaugurar esse importante projeto. Esta iniciativa é uma afirmação da riqueza e diversidade da produção artística no Ceará, mostrando que nossa cena é pulsante e merece destaque. Convidamos todos a mergulharem no universo desses dois incríveis artistas, descobrindo suas histórias e inspirações únicas”, celebra Lenise Queiroz Rocha, presidente da Fundação Edson Queiroz.';

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Exposicao(
              imageUrl:
                  'https://www.unifor.br/documents/20143/0/Centelhas%2bem%2bMovimento_800.jpg/f8a3f4c4-5932-354a-73b9-9664d0370943?t%3d1709584944422',
              title: 'Centelhas em Movimento',
              description: descricao1,
            ),
            Exposicao(
              imageUrl:
                  'https://www.unifor.br/documents/20143/573160/Projeto%2bTrajet%25C3%25B3rias%2b800.jpg/a5378dfd-98c7-7f53-415e-0f72cd1a8449?t%3d1709735833314',
              title: 'Trajetórias Artísticas Unifor',
              description: descricao2,
            ),
          ],
        ),
      ),
    );
  }
}


