# Modelagem Cinemática de Manipuladores Robóticos

Este projeto contém scripts desenvolvidos em MATLAB/Octave para realizar a modelagem da cinemática direta e a visualização 3D de cinco configurações clássicas de manipuladores robóticos: Cilíndrico, SCARA, Cartesiano, Articulado e Esférico. O sistema utiliza cálculo simbólico para gerar as matrizes de transformação homogénea baseadas na convenção de Denavit-Hartenberg (D-H) e plota graficamente os sistemas de coordenadas (frames) de cada junta do robô no espaço tridimensional.

## 🛠️ Tecnologias e Conceitos Utilizados
* **Linguagem/Ambiente:** MATLAB / GNU Octave
* **Cálculo Simbólico:** Pacote `symbolic` (Octave) / SymPy (Python)
* **Robótica:** Cinemática Direta, Parâmetros de Denavit-Hartenberg (Tabela D-H), Matrizes de Transformação Homogénea (Translações e Rotações)
* **Visualização:** Gráficos 3D espaciais para mapeamento de juntas e elos (`plot3`)

## 🤖 Resumo dos Scripts

**Robô Cilíndrico (`Cilindrico.m`)**
Modela um robô de 3 graus de liberdade (DoF) com configuração **RPP** (Rotacional-Prismática-Prismática). O script calcula as transformações sucessivas utilizando três matrizes baseadas nos parâmetros D-H e plota as ligações e os eixos ortogonais X (azul), Y (verde) e Z (vermelho) do frame global até o efetor final no frame 3.

**Robô SCARA (`SCARA.m`)**
Simula um manipulador SCARA com configuração **RRP** (Rotacional-Rotacional-Prismática), utilizando variáveis simbólicas para os elos (`a2`, `a3`) e rotações das juntas. O código estabelece quatro transformações D-H sucessivas para mapear as posições, aplicando as limitações geométricas da estrutura e desenhando os frames do nível 0 ao 4.

**Robô Cartesiano (`Cartesiano.m`)**
Implementa a cinemática de um manipulador com configuração **PPP** (Prismática-Prismática-Prismática) operando em eixos ortogonais. As matrizes de rotação aplicam ângulos de 90° e -90° para alinhar as transformações espaciais, gerando as coordenadas 3D das ligações estruturais entre os frames 0 e 4.

**Robô Articulado (`Articulado.m`)**
Calcula as coordenadas espaciais de um braço robótico com configuração **RRR** (Rotacional-Rotacional-Rotacional). A tabela D-H aplica deslocamentos angulares nas juntas de base, ombro e cotovelo, convertendo as matrizes simbólicas em valores numéricos (double) para a renderização das hastes de ligação no gráfico 3D.

**Robô Esférico (`Esferico.m`)**
Modela uma estrutura com configuração **RRP** (Rotacional-Rotacional-Prismática). Uma característica fundamental deste script é a utilização de um frame intermediário (Transformação 2) exclusivamente para o reposicionamento do eixo Z, permitindo o alinhamento correto do efetor final (Frame 4).

## 🚀 Como Usar e Pré-requisitos

Para executar estes scripts, é necessário ter o **GNU Octave** ou o **MATLAB** instalado no seu computador. Os códigos fazem uso do pacote simbólico (`symbolic`), que exige uma configuração inicial caso esteja a utilizar o Octave.

### Configuração no GNU Octave

1. **Instalação do SymPy (Python):** O pacote simbólico do Octave depende do Python e da biblioteca SymPy. Certifique-se de que tem o Python instalado no seu sistema e instale o SymPy através da linha de comandos:
   ```bash
   pip install sympy
