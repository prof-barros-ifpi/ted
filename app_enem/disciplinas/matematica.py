import numpy as np
import matplotlib.pyplot as plt
from io import BytesIO
import base64
from disciplinas.base import Disciplina

class EquacaoSegundoGrau:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def delta(self):
        return self.b**2 - 4*self.a*self.c

    def raizes(self):
        d = self.delta()
        if d < 0:
            return None, None
        x1 = (-self.b + d**0.5) / (2*self.a)
        x2 = (-self.b - d**0.5) / (2*self.a)
        return x1, x2

    def gerar_grafico(self):
        x = np.linspace(-10, 10, 200)
        y = self.a*x**2 + self.b*x + self.c

        fig, ax = plt.subplots()
        ax.plot(x, y, label=f"{self.a}x² + {self.b}x + {self.c}")
        ax.axhline(0, color='gray', linewidth=0.8)
        ax.set_title("Gráfico da Função Quadrática")
        ax.legend()

        # Converter imagem para base64
        buf = BytesIO()
        fig.savefig(buf, format="png")
        buf.seek(0)
        return base64.b64encode(buf.read()).decode('utf-8')