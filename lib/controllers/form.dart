class FormCadastroController {
  
  static validarNome(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!value.contains(' ')) {
      return 'Nome inválido';
    }

    if (value[0] == ' ' || value[value.length - 1] == ' ') {
      return 'Nome inválido';
    }

    for (int i = 0; i < value.length; i++) {
      if (!value[i].contains(RegExp(r'[a-z]')) &&
          !value[i].contains(RegExp(r'[A-Z]')) &&
          value[i] != ' ') {
        return 'Nome inválido';
      }
    }

    return null;
  }

  static validarEmail(String value) {
    int arroba = 0;

    if (value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!value.contains('@')) {
      return 'Formato de email inválido';
    }

    if (value.indexOf('@') < 5) {
      return 'Formato de email inválido';
    }

    for (int i = 0; i < value.length; i++) {
      if (value[i] == '@') {
        arroba++;
      }
      if (!value[i].contains(RegExp(r'[0-9]')) &&
          !value[i].contains(RegExp(r'[a-z]')) &&
          !value[i].contains(RegExp(r'[A-Z]')) &&
          value[i] != '@' &&
          value[i] != '.' &&
          value[i] != '_') {
        return 'Formato de email inválido';
      }
    }

    if (arroba > 1) {
      return 'Formato de email inválido';
    }

    if (value.substring(value.length - 4, value.length) != '.com' &&
        value.substring(value.length - 7, value.length) != '.com.br') {
      return 'Formato de email inválido';
    }

    if (value.substring(value.length - 4, value.length) == '.com' &&
        value.length < value.indexOf('@') + 8) {
      return 'Formato de email inválido';
    }

    if (value.substring(value.length - 7, value.length) == '.com.br' &&
        value.length < value.indexOf('@') + 11) {
      return 'Formato de email inválido';
    }

    return null;
  }

  static validarSenha(String value) {
    int minusculo = 0;
    int maiusculo = 0;
    int numeros = 0;

    if (value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (value.length < 8) {
      return 'Mínino 8 caractéres';
    }

    for (int i = 0; i < value.length; i++) {
      if (value[i].contains(RegExp(r'[0-9]'))) {
        numeros++;
      }
      if (value[i].contains(RegExp(r'[a-z]'))) {
        minusculo++;
      }
      if (value[i].contains(RegExp(r'[A-Z]'))) {
        maiusculo++;
      }
    }

    if (minusculo < 1) {
      return "Letra minuscula obrigatória";
    }

    if (maiusculo < 1) {
      return "Letra maiuscula obrigatória";
    }

    if (numeros < 1) {
      return "Numero obrigatório";
    }

    return null;
  }

  static validarConfirmarSenha(value, senha) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (value != senha) {
      return 'Senhas não conferem';
    }
    return null;
  }

}

class FormLoginController {
  static validarLogin(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
