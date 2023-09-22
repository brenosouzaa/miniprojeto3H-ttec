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
  // historico
  {
    'c1a7xpq5': {
      'en': 'Histórico',
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
  // HomePage
  {
    '5vxf8d4q': {
      'en': 'TechZoom',
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
    'ygceut6w': {
      'en': 'Notificação',
      'es': '',
    },
    'qri3zotv': {
      'en': 'Modo Claro',
      'es': '',
    },
    'kygbs1et': {
      'en': 'Modo Escuro',
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
    '1eqpocpb': {
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
  // fichattecnica
  {
    'x1md5wno': {
      'en': 'Ficha Técnica ',
      'es': '',
    },
    '4rg3zudd': {
      'en': 'Home',
      'es': '',
    },
  },
  // busca
  {
    'xt3y0u8n': {
      'en': 'Busca',
      'es': '',
    },
    'xpf0ud6s': {
      'en': 'Pesquisa',
      'es': '',
    },
    'dwzxmxl9': {
      'en': '20 resultados encontrados',
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
  // resultado
  {
    '1csnndnh': {
      'en': 'Resultado',
      'es': '',
    },
    'jef4o55b': {
      'en': 'Mais',
      'es': '',
    },
    'x2vsl3zj': {
      'en': 'Ficha Tecnica',
      'es': '',
    },
    '9v77yms3': {
      'en': 'Nosso FeedBack',
      'es': '',
    },
    'ustay7we': {
      'en': 'Avaliações',
      'es': '',
    },
    'lbod9xp8': {
      'en': '4.3%',
      'es': '',
    },
    '11qxr3j8': {
      'en': '50 pessoas deram nota pra  esse produto',
      'es': '',
    },
    'k3odkpkl': {
      'en': '70%',
      'es': '',
    },
    'yyne5hax': {
      'en': '20%',
      'es': '',
    },
    'fijpv8i2': {
      'en': '10%',
      'es': '',
    },
    'qvukl2b4': {
      'en': '0%',
      'es': '',
    },
    'apaogspq': {
      'en': '0%',
      'es': '',
    },
    'if2ww7ln': {
      'en': 'Avaliar',
      'es': '',
    },
    'dayj7hpo': {
      'en': 'Comentarios 32',
      'es': '',
    },
    'oicwincg': {
      'en': 'Filtrar',
      'es': '',
    },
    'sulv01tn': {
      'en': 'comentar',
      'es': '',
    },
    '98bhrqp3': {
      'en': '10h',
      'es': '',
    },
    'i5yxiis4': {
      'en': '190 Curtida',
      'es': '',
    },
    'uz896wkn': {
      'en': '- 299 Comentarios',
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
      'en': 'Feedback',
      'es': '',
    },
    'efqmwk3a': {
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
  // suporte
  {
    'ewade4g7': {
      'en': 'Central de Ajuda',
      'es': '',
    },
    'klev9iag': {
      'en': 'Como podemos ajudar?',
      'es': '',
    },
    '7s3q0ko2': {
      'en': 'Digite sua pergunta',
      'es': '',
    },
    'f7gve9cl': {
      'en': 'Digite sua pergunta...',
      'es': '',
    },
    'y390cwwd': {
      'en': 'Perguntas Frequentes',
      'es': '',
    },
    'kjmdlgdl': {
      'en': '24',
      'es': '',
    },
    't99s31ct': {
      'en': 'Como faço para criar uma conta?',
      'es': '',
    },
    'i6iumetn': {
      'en': 'Como posso entrar em contato com o suporte?',
      'es': '',
    },
    'xe8mrlv8': {
      'en': 'Como posso alterar minha senha?',
      'es': '',
    },
    'fneke5mn': {
      'en': 'Como faço para cancelar minha conta?',
      'es': '',
    },
    'ud6fe7lk': {
      'en': 'Como posso recuperar minha conta?',
      'es': '',
    },
    't4ovflji': {
      'en': 'Como faço para atualizar minhas informações pessoais?',
      'es': '',
    },
    'we9vfoju': {
      'en': 'Como posso visualizar minhas transações?',
      'es': '',
    },
    '59tvln5r': {
      'en': 'Como posso solicit',
      'es': '',
    },
    '7qi3avlj': {
      'en': 'Como posso alterar minhas preferências de notificação?',
      'es': '',
    },
    'xuakxalg': {
      'en': 'Como posso denunciar um problema?',
      'es': '',
    },
    'v8moygzr': {
      'en': 'Entrar em Contato',
      'es': '',
    },
    'adaxc2bx': {
      'en': 'Suporte',
      'es': '',
    },
  },
  // perfil2
  {
    'ivdwznvd': {
      'en': 'Perfil',
      'es': '',
    },
    'tvbvb3ff': {
      'en': 'Nome:',
      'es': '',
    },
    's7qq23pa': {
      'en': 'Apelido:',
      'es': '',
    },
    '7oky8qt2': {
      'en': 'Email',
      'es': '',
    },
    '44s4macx': {
      'en': 'Mais',
      'es': '',
    },
    '26j24elk': {
      'en': 'Sair da Conta',
      'es': '',
    },
  },
  // feedback1
  {
    '1u79gir3': {
      'en': 'Nome',
      'es': '',
    },
    'htyut5o1': {
      'en': 'Digite seu nome',
      'es': '',
    },
    'p38e6rhn': {
      'en': 'Email',
      'es': '',
    },
    '09cr63y7': {
      'en': 'Digite seu email',
      'es': '',
    },
    'raocdvec': {
      'en': 'mensagem',
      'es': '',
    },
    'fwrpp2p4': {
      'en': 'Digite sua mensagem',
      'es': '',
    },
    'jhhidl62': {
      'en': 'Enviar',
      'es': '',
    },
    'i1anabuj': {
      'en': 'Deixe seu Feedback',
      'es': '',
    },
  },
  // avaliacao
  {
    'nkj8qqei': {
      'en': 'Suporte',
      'es': '',
    },
    '7zzww3y5': {
      'en': 'Fale Conosco',
      'es': '',
    },
    'j8pqhhrf': {
      'en': 'Feedback',
      'es': '',
    },
    'xpa64qhb': {
      'en': 'Avaliar',
      'es': '',
    },
    'l345e1yy': {
      'en': 'Avaliação',
      'es': '',
    },
  },
  // Conecteseans
  {
    'ezlo0eat': {
      'en': 'Conecte-se a nós',
      'es': '',
    },
    'wqdpfsg6': {
      'en':
          'Estamos aqui para ajudar. Entre em contato conosco se tiver alguma dúvida ou precisar de suporte.',
      'es': '',
    },
    'pjifxxjb': {
      'en': 'Telefone: (XX) XXXX-XXXX',
      'es': '',
    },
    'fskcnl55': {
      'en': 'Email: suporte@exemplo.com',
      'es': '',
    },
    'v9qslonz': {
      'en': 'Conecte-se a nós',
      'es': '',
    },
  },
  // notificacao
  {
    'y4epj6e6': {
      'en': 'Configurações de Notificação',
      'es': '',
    },
    'ncuxej0i': {
      'en': 'Habilitar Notificações',
      'es': '',
    },
    'v9ynrqzy': {
      'en': 'Receber Alertas de Comentários',
      'es': '',
    },
    '3mhgkwuw': {
      'en': 'Receber Alertas de Curtidas',
      'es': '',
    },
    'r1z128y3': {
      'en': 'Receber Alertas do Aplicativo',
      'es': '',
    },
    '9c1iwy6v': {
      'en': 'Notificação',
      'es': '',
    },
  },
  // comentar
  {
    'g5bls6f7': {
      'en': 'Comentario',
      'es': '',
    },
    'p7nv14m3': {
      'en': 'Seu comentario',
      'es': '',
    },
    'fz6kk8b3': {
      'en': 'Avaliar:',
      'es': '',
    },
    'v827n37o': {
      'en': 'Postar',
      'es': '',
    },
    'leshcyxe': {
      'en': 'Comentar',
      'es': '',
    },
    '094h89k2': {
      'en': 'Home',
      'es': '',
    },
  },
  // avaliacaoempresa
  {
    '3e1khfx8': {
      'en': 'Por favor, avalie a empresa abaixo.',
      'es': '',
    },
    'umvk590f': {
      'en': 'Enviar Avaliação',
      'es': '',
    },
    'aqm3c17p': {
      'en': 'Avalie a Empresa',
      'es': '',
    },
  },
  // categoria
  {
    'lc9z4tt0': {
      'en': 'Categoria',
      'es': '',
    },
    '9zv2nluw': {
      'en': 'Pesquisar produtos...',
      'es': '',
    },
    '8nvxtpxo': {
      'en': 'Smartphone',
      'es': '',
    },
    'f18bs10q': {
      'en': 'Computador',
      'es': '',
    },
    'vpswrqzc': {
      'en': 'TV',
      'es': '',
    },
    'qrxq3cma': {
      'en': 'Tablet',
      'es': '',
    },
    'dse90l3n': {
      'en': 'Fone',
      'es': '',
    },
    'vsq1zjm9': {
      'en': 'smartwatch',
      'es': '',
    },
    'xsh9ddzr': {
      'en': 'Monitor',
      'es': '',
    },
    'f8okkjqe': {
      'en': 'Teclado',
      'es': '',
    },
    '2knjmtoi': {
      'en': 'Notebook',
      'es': '',
    },
    '8wcg5lcf': {
      'en': 'Mouse',
      'es': '',
    },
  },
  // categoriaCopy
  {
    'm41cs7yc': {
      'en': 'Categoria',
      'es': '',
    },
    'fws4h6fm': {
      'en': 'Pesquisar produtos...',
      'es': '',
    },
    'qxjh0kdu': {
      'en': 'Categorias',
      'es': '',
    },
    'pfekvkwh': {
      'en': 'Smartphone',
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
  // DarkLightSwitchLarge
  {
    'uyz0o4wb': {
      'en': 'Light Mode',
      'es': '',
    },
    'dsxo1wc4': {
      'en': 'Dark Mode',
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
