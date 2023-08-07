import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // cadastro
  {
    'gyo5nz4v': {
      'en': 'Cadastrar',
      'es': '',
    },
    'l2mzg09p': {
      'en': 'TECH ZOOM',
      'es': '',
    },
    '2bfd3ly9': {
      'en': 'Nome:',
      'es': '',
    },
    'v2xpnxfy': {
      'en': 'Apelido:',
      'es': '',
    },
    '20jqudjx': {
      'en': 'Email:',
      'es': '',
    },
    'm51khfpb': {
      'en': 'Senha:',
      'es': '',
    },
    '83ipiu79': {
      'en': 'Confirmar senha:',
      'es': '',
    },
    'xklritch': {
      'en': 'Cadastrar',
      'es': '',
    },
    'dhj397q9': {
      'en': 'Home',
      'es': '',
    },
  },
  // login
  {
    'gh5ylvzd': {
      'en': 'Login',
      'es': '',
    },
    '74pic22d': {
      'en': 'TECH ZOOM',
      'es': '',
    },
    'kkgnqdcg': {
      'en': 'Email:',
      'es': '',
    },
    'cwm8kwlu': {
      'en': 'Senha:',
      'es': '',
    },
    '7k6ilrrp': {
      'en': 'Esqueceu a senha?',
      'es': '',
    },
    'k20059yd': {
      'en': 'Entrar',
      'es': '',
    },
    'o04yvtdl': {
      'en': 'Cadastrar',
      'es': '',
    },
    '7mq92bgt': {
      'en': 'usar rede social',
      'es': '',
    },
    'k8n9lc09': {
      'en': 'Home',
      'es': '',
    },
  },
  // HomePage
  {
    '5vxf8d4q': {
      'en': 'tech zoom',
      'es': '',
    },
    'avzu4nml': {
      'en': 'Minha Conta',
      'es': '',
    },
    'k2ec3jp3': {
      'en': 'Categoria',
      'es': '',
    },
    'amxbainq': {
      'en': 'Pesquisa',
      'es': '',
    },
    '21u1prih': {
      'en': 'PlayStation',
      'es': '',
    },
    '250z8yzy': {
      'en': 'Xbox',
      'es': '',
    },
    'mq0chn5i': {
      'en': 'Nintendo',
      'es': '',
    },
    '8y0uigl8': {
      'en': 'Console',
      'es': '',
    },
    '4oydp6co': {
      'en': 'Relogio',
      'es': '',
    },
    'v6jysof1': {
      'en': 'Relogio 02',
      'es': '',
    },
    'rt84itn7': {
      'en': 'Relogio 03',
      'es': '',
    },
    'qf34qb3w': {
      'en': 'Relogio',
      'es': '',
    },
    's9zinxw3': {
      'en': 'computador',
      'es': '',
    },
    'gtph7r96': {
      'en': 'Computador01',
      'es': '',
    },
    'rg2xpjzd': {
      'en': 'Computado02',
      'es': '',
    },
    'o33ducd4': {
      'en': 'Pc',
      'es': '',
    },
    'lba2q6v7': {
      'en': 'Option 1',
      'es': '',
    },
    'l73ui8eb': {
      'en': 'cam01',
      'es': '',
    },
    'csdhx4mz': {
      'en': 'cam02',
      'es': '',
    },
    'u2zvchiy': {
      'en': 'Camera',
      'es': '',
    },
    '1aafjglf': {
      'en': 'Option 1',
      'es': '',
    },
    'g0bara0q': {
      'en': 'Celular',
      'es': '',
    },
    'cylis2xq': {
      'en': 'Celular',
      'es': '',
    },
    'oomep6og': {
      'en': 'Celular',
      'es': '',
    },
    'viq4n6y2': {
      'en': 'Option 1',
      'es': '',
    },
    'x2a79482': {
      'en': 'Televisao',
      'es': '',
    },
    'fw6tqi5l': {
      'en': 'Televisao',
      'es': '',
    },
    'gmct3c11': {
      'en': 'Tv',
      'es': '',
    },
    'oyl1zm30': {
      'en': 'Option 1',
      'es': '',
    },
    'wztck8lm': {
      'en': 'Fones01',
      'es': '',
    },
    'xo5268h0': {
      'en': 'Fones02',
      'es': '',
    },
    '99jqx0sx': {
      'en': 'Fones',
      'es': '',
    },
    'dl4wmpet': {
      'en': 'Option 1',
      'es': '',
    },
    'dfl5inui': {
      'en': 'Eletrodomestico',
      'es': '',
    },
    'jk3j6toq': {
      'en': 'Eletrodomestico',
      'es': '',
    },
    '74d6xg89': {
      'en': 'Domestico',
      'es': '',
    },
    'y1six6fm': {
      'en': 'Rede social',
      'es': '',
    },
    'z62llhpv': {
      'en': 'Ajuda',
      'es': '',
    },
    '9090gz5n': {
      'en': 'Pesquisa',
      'es': '',
    },
    'ife553ei': {
      'en': 'Lançamentos',
      'es': '',
    },
    'ztn3iqrd': {
      'en': 'Lançamentos',
      'es': '',
    },
    'vn2s1aye': {
      'en': 'Home',
      'es': '',
    },
  },
  // configuracao
  {
    '3r2lkr66': {
      'en': 'Configurações',
      'es': '',
    },
    'edmiqr6c': {
      'en': 'Minha conta',
      'es': '',
    },
    '4plav6ws': {
      'en': 'Conta',
      'es': '',
    },
    'jlbmt5mv': {
      'en': 'Historico',
      'es': '',
    },
    'isvvpcdv': {
      'en': 'Favorito',
      'es': '',
    },
    'qz3x87ng': {
      'en': 'Configurações',
      'es': '',
    },
    'ees3r1wq': {
      'en': 'Privacidade',
      'es': '',
    },
    'ygceut6w': {
      'en': 'Notificação',
      'es': '',
    },
    'yy1rnd40': {
      'en': 'Favorito',
      'es': '',
    },
    'rdpld0pe': {
      'en': 'Favorito',
      'es': '',
    },
    'ntr1vzr0': {
      'en': 'Suporte',
      'es': '',
    },
    'dc49clv7': {
      'en': 'Central de Ajuda',
      'es': '',
    },
    '11hy7rmp': {
      'en': 'Avaliação e Feedback',
      'es': '',
    },
    'h3fnczw8': {
      'en': 'Conecte-se a nós',
      'es': '',
    },
    '1eqpocpb': {
      'en': 'Home',
      'es': '',
    },
  },
  // historico
  {
    'c1a7xpq5': {
      'en': 'Historico',
      'es': '',
    },
    'h5rg8ed7': {
      'en': 'pesquisar',
      'es': '',
    },
    'x4xpqbit': {
      'en': 'comfcm',
      'es': '',
    },
    'yx2gss9p': {
      'en': 'comds',
      'es': '',
    },
    '6eiowdjv': {
      'en': 'Vistos anteriores',
      'es': '',
    },
    'e825ajan': {
      'en': 'Filtrar',
      'es': '',
    },
    'pfistsrq': {
      'en': 'Excluir',
      'es': '',
    },
    '3l3pcn5r': {
      'en': 'Motorola Edge 30 5G ',
      'es': '',
    },
    'u113nmxz': {
      'en': 'Home',
      'es': '',
    },
  },
  // conta
  {
    't850zrau': {
      'en': 'Privacidade',
      'es': '',
    },
    '2av109ga': {
      'en': 'Meu Perfil ',
      'es': '',
    },
    'bhqylfju': {
      'en': 'Nome:',
      'es': '',
    },
    '3qkw663z': {
      'en': 'Apelido:',
      'es': '',
    },
    'qio2zn25': {
      'en': 'Email:',
      'es': '',
    },
    '1f39be5t': {
      'en': 'Trocar Senha',
      'es': '',
    },
    'z9v65o6w': {
      'en': 'Excluir Conta',
      'es': '',
    },
    '4laisvk5': {
      'en': 'Home',
      'es': '',
    },
  },
  // favorito
  {
    '53bmqyi2': {
      'en': 'Favoritos',
      'es': '',
    },
    '8f42ww3b': {
      'en': 'pesquisar',
      'es': '',
    },
    'q7xpsltv': {
      'en': 'comfcm',
      'es': '',
    },
    'fwsrl1rs': {
      'en': 'comds',
      'es': '',
    },
    'w33w2x8l': {
      'en': 'Curtidos',
      'es': '',
    },
    'gx9369ec': {
      'en': 'Filtrar',
      'es': '',
    },
    '70qabtxo': {
      'en': 'Home',
      'es': '',
    },
  },
  // busca
  {
    'xt3y0u8n': {
      'en': 'busca',
      'es': '',
    },
    'xpf0ud6s': {
      'en': 'Pesquisa',
      'es': '',
    },
    'dwzxmxl9': {
      'en': '20 resultados encontrado',
      'es': '',
    },
    'ttmgt07e': {
      'en': 'filtrar',
      'es': '',
    },
    'vd263tee': {
      'en': 'Apple',
      'es': '',
    },
    'f1w09wkv': {
      'en': 'Iphone 11',
      'es': '',
    },
    'pyj4zhwm': {
      'en': '5.0',
      'es': '',
    },
    'g1g5i175': {
      'en': 'Home',
      'es': '',
    },
  },
  // ajuda
  {
    'wxpqt5xq': {
      'en': 'Serviços',
      'es': '',
    },
    '2r9bc2mk': {
      'en': 'Notificação',
      'es': '',
    },
    'oj5viiri': {
      'en': 'Modo escuro',
      'es': '',
    },
    'hmxfpili': {
      'en': 'Historico',
      'es': '',
    },
    'nvps3q6w': {
      'en': 'Suporte',
      'es': '',
    },
    'sdyv34po': {
      'en': 'Privacidade ',
      'es': '',
    },
    'nm4hxtbo': {
      'en': 'Favoritos',
      'es': '',
    },
    '5u7f5ef5': {
      'en': 'Sobre o app',
      'es': '',
    },
    '3h42s984': {
      'en': 'Instrução',
      'es': '',
    },
    'fps6jy6t': {
      'en': 'Feedback',
      'es': '',
    },
    'vmz7xg0y': {
      'en': 'Denunciar',
      'es': '',
    },
    'xiz5wqyw': {
      'en': 'Meu Perfil ',
      'es': '',
    },
    '9mra9wgw': {
      'en': 'Mais',
      'es': '',
    },
    'lyi3586m': {
      'en': 'Hom',
      'es': '',
    },
  },
  // conta01
  {
    'vb78bao2': {
      'en': 'Alterar Foto do perfil',
      'es': '',
    },
    'skjkfqda': {
      'en': 'Nome:',
      'es': '',
    },
    'kxp8nqhq': {
      'en': 'Apelido:',
      'es': '',
    },
    'nwlwpl9m': {
      'en': 'Email:',
      'es': '',
    },
    '81lbxks8': {
      'en': 'Sair',
      'es': '',
    },
    'xivprxt4': {
      'en': 'Excluir conta',
      'es': '',
    },
    '1cd3ir0t': {
      'en': 'Conta',
      'es': '',
    },
  },
  // fichattecnica
  {
    'x1md5wno': {
      'en': 'Ficha Tecnica ',
      'es': '',
    },
    '4rg3zudd': {
      'en': 'Home',
      'es': '',
    },
  },
  // perfil
  {
    'ev77dc1t': {
      'en': 'Nome completo',
      'es': '',
    },
    'p47n0j4e': {
      'en': 'Apelido',
      'es': '',
    },
    'tx56qfr3': {
      'en': 'Email',
      'es': '',
    },
    'a08a8jpf': {
      'en': 'Conta',
      'es': '',
    },
    'ygrmkve9': {
      'en': 'Home',
      'es': '',
    },
  },
  // resultado
  {
    '1csnndnh': {
      'en': 'Page Title',
      'es': '',
    },
    '3h873k4e': {
      'en': 'Mais',
      'es': '',
    },
    'hrq61lwl': {
      'en': 'Ficha Tecnica',
      'es': '',
    },
    'zstqrpgf': {
      'en': 'Nosso FeedBack',
      'es': '',
    },
    'bng48ak7': {
      'en': 'Avaliações',
      'es': '',
    },
    '23da72gy': {
      'en': '4.9%',
      'es': '',
    },
    'do53vlwm': {
      'en': '50 pessoas deram nota pra  esse produto',
      'es': '',
    },
    '0nkw1g8o': {
      'en': '70%',
      'es': '',
    },
    '9va959eh': {
      'en': '20%',
      'es': '',
    },
    '0lyqufdi': {
      'en': '10%',
      'es': '',
    },
    'r9uscl1t': {
      'en': '0%',
      'es': '',
    },
    'n2qi0sco': {
      'en': '0%',
      'es': '',
    },
    '9rdizj5a': {
      'en': 'Avaliar',
      'es': '',
    },
    'si121b4y': {
      'en': 'Comentarios 32',
      'es': '',
    },
    'q0nsukwd': {
      'en': 'Filtrar',
      'es': '',
    },
    'r1yvsje2': {
      'en': 'comentar',
      'es': '',
    },
    'oekdg6kf': {
      'en': '@CR7',
      'es': '',
    },
    'cfqe2api': {
      'en':
          'Celular maravilhoso, leve (muito leve \nmesmo), rápido, muito bom para usar\n horas e horas, a bateria é incrível! ',
      'es': '',
    },
    'cubhw6l4': {
      'en': '20',
      'es': '',
    },
    'xpefm1ch': {
      'en': 'Responder',
      'es': '',
    },
    'uv9lyx8f': {
      'en': '@messi',
      'es': '',
    },
    'zrkm4kfj': {
      'en':
          'Só deixou a desejar a bateria mesmo,\n mais um aparelho espetacular, estou\n super satisfeita!! ',
      'es': '',
    },
    'gbn39k9x': {
      'en': '16',
      'es': '',
    },
    'pqeg1k6u': {
      'en': 'Responder',
      'es': '',
    },
    'z6fugasl': {
      'en': '@icadi_rei_delas',
      'es': '',
    },
    '5upnpkir': {
      'en':
          'Só deixou a desejar a bateria mesmo,\n mais um aparelho espetacular, estou\n super satisfeita!! ',
      'es': '',
    },
    'larfg41x': {
      'en': '14',
      'es': '',
    },
    'l4uxqpyv': {
      'en': 'Responder',
      'es': '',
    },
    'nen9mk0o': {
      'en': 'Home',
      'es': '',
    },
  },
  // feedback
  {
    'xz3wzdgt': {
      'en': 'feedback',
      'es': '',
    },
    'efqmwk3a': {
      'en': 'Home',
      'es': '',
    },
  },
  // djdn
  {
    '8kknkynj': {
      'en': ' Edge 30 ',
      'es': '',
    },
    '10qu41fq': {
      'en': 'Motorola',
      'es': '',
    },
    '3rfn4jtp': {
      'en': 'Page Title',
      'es': '',
    },
    'o2vybjhu': {
      'en': 'Home',
      'es': '',
    },
  },
  // nome
  {
    'kjnvlg12': {
      'en': 'Mudar o nome ',
      'es': '',
    },
    'cna4krq1': {
      'en': 'apenas 100 caracteres',
      'es': '',
    },
    'k6c444bi': {
      'en': 'Salvar',
      'es': '',
    },
    'xoj46py1': {
      'en': 'Mudar Nome',
      'es': '',
    },
    'nub6qaxx': {
      'en': 'Home',
      'es': '',
    },
  },
  // excluir
  {
    'ccnv05gt': {
      'en': ' excluir conta ',
      'es': '',
    },
    'hkvg6ggt': {
      'en': 'CONFIRMAR',
      'es': '',
    },
    'fdy6twad': {
      'en': 'CANCELAR',
      'es': '',
    },
  },
  // comentario
  {
    'bqs8kj0c': {
      'en': '@messi',
      'es': '',
    },
    'emuotjlw': {
      'en': 'messiet@gmal.com',
      'es': '',
    },
    'rdva3f6g': {
      'en': 'Avaliar',
      'es': '',
    },
    'au7l1hiq': {
      'en': 'Comentario',
      'es': '',
    },
    'crqb2cs9': {
      'en': ' Comentar...',
      'es': '',
    },
    '21prpsfj': {
      'en': '  ',
      'es': '',
    },
    '059s551w': {
      'en': 'Excluir',
      'es': '',
    },
    'lku0a4b6': {
      'en': 'Postar',
      'es': '',
    },
  },
  // avaliar
  {
    'zppwrabf': {
      'en': 'apelido',
      'es': '',
    },
    '7b6fdbmh': {
      'en': 'nome',
      'es': '',
    },
    'i28axm0j': {
      'en': 'Avaliar:',
      'es': '',
    },
    '4ayixtf3': {
      'en': 'Cancelar',
      'es': '',
    },
    'x4pb9rrx': {
      'en': 'Confirmar',
      'es': '',
    },
  },
  // alteranome
  {
    'fs2ggr1o': {
      'en': 'Alterar seu nome:',
      'es': '',
    },
    'jlowc4so': {
      'en': 'Cancelar',
      'es': '',
    },
    't25g7k2s': {
      'en': 'Confirmar',
      'es': '',
    },
  },
  // alterarapelido
  {
    'vgrubc74': {
      'en': 'Alterar seu apelido:',
      'es': '',
    },
    'i39e4tp2': {
      'en': 'Cancelar',
      'es': '',
    },
    'nvo6y0w8': {
      'en': 'Confirmar',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'q8msh1gx': {
      'en': '',
      'es': '',
    },
    'zqx56c0r': {
      'en': '',
      'es': '',
    },
    'jkahbu6p': {
      'en': 'permtir q vc sea notificado',
      'es': '',
    },
    'ya7o4k0x': {
      'en': '',
      'es': '',
    },
    'h6l6hp0g': {
      'en': '',
      'es': '',
    },
    '846xi1dm': {
      'en': '',
      'es': '',
    },
    '8spe97zh': {
      'en': '',
      'es': '',
    },
    'lhs7zjqs': {
      'en': '',
      'es': '',
    },
    'z7kldmlb': {
      'en': '',
      'es': '',
    },
    'o9y03v8g': {
      'en': '',
      'es': '',
    },
    '4gr78jly': {
      'en': '',
      'es': '',
    },
    'oip8vv6i': {
      'en': '',
      'es': '',
    },
    '9zjsdnkb': {
      'en': '',
      'es': '',
    },
    'ftveq3ss': {
      'en': '',
      'es': '',
    },
    'f5jr7ppi': {
      'en': '',
      'es': '',
    },
    'alp0dsde': {
      'en': '',
      'es': '',
    },
    'rurfz89q': {
      'en': '',
      'es': '',
    },
    '34mlya7i': {
      'en': '',
      'es': '',
    },
    'yurejdua': {
      'en': '',
      'es': '',
    },
    'x2bkhshq': {
      'en': '',
      'es': '',
    },
    'neh13dso': {
      'en': '',
      'es': '',
    },
    'p61dhohi': {
      'en': '',
      'es': '',
    },
    'k7kt09mi': {
      'en': '',
      'es': '',
    },
    'w8nc1e1h': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
