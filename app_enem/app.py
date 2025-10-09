import streamlit as st
from disciplinas.matematica import EquacaoSegundoGrau

st.title("📘 Matemática Interativa - Equação do 2º Grau")

a = st.number_input("Coeficiente a:", value=1.0)
b = st.number_input("Coeficiente b:", value=0.0)
c = st.number_input("Coeficiente c:", value=0.0)

if st.button("Calcular"):
    eq = EquacaoSegundoGrau(a, b, c)
    delta = eq.delta()
    x1, x2 = eq.raizes()

    st.write(f"Δ = {delta:.2f}")
    if x1 is not None:
        st.write(f"x₁ = {x1:.2f}, x₂ = {x2:.2f}")
    else:
        st.write("Sem raízes reais.")

    img_base64 = eq.gerar_grafico()
    st.image(f"data:image/png;base64,{img_base64}")