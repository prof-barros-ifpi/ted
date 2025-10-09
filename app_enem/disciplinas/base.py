class Disciplina:
    def __init__(self, nome):
        self.nome = nome

    def descricao(self):
        return f"Bem-vindo(a) à disciplina de {self.nome}!"