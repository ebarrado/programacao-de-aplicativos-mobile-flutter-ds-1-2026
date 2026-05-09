class Produto {
  final String? id;
  final String nome;
  final String descricao;
  final int quantidade;
  final double valor;
  final String imagem;

  // toda classe tem um construtor
  Produto({
    this.id,
    required this.nome,
    required this.descricao,
    required this.quantidade,
    required this.valor,
    required this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      '!12_nome': nome,
      'descricao': descricao,
      'quantidade': quantidade,
      'valor': valor,
      'imagem': imagem,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map, String documentId) {
    return Produto(
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      quantidade: map['quantidade'] ?? 0,
      valor: (map['valor'] ?? 0).toDouble(),
      imagem: map['imagem']?? '',
    );
  }

  

}
