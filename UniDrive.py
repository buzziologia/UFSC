class Cliente:
  def __init__(self):
      self.clientes = {}
  def cadastrar(self, cpf, nome, nascimento, endereco, email, telefone, cartao):
      if cpf not in self.clientes:
          self.clientes[cpf] = {
              'nome': nome,
              'nascimento': nascimento,
              'endereco': endereco,
              'email': email,
              'telefone': telefone,
              'cartao': cartao
          }
          print(f"Usuária(o) {nome} cadastrada(o) com sucesso!")
      else:
          print("Usuária(o) já possui cadastro.")
  def coletar_dados_cartao(self, cpf):
      if cpf in self.clientes:
          return self.clientes[cpf]['cartao']
      else:
          return "Cliente não encontrado."
        
class Veiculo:
  def __init__(self, marca, modelo, ano, direcao, ar_condicionado):
      self.marca = marca
      self.modelo = modelo
      self.ano = ano
      self.direcao = direcao
      self.ar_condicionado = ar_condicionado
    
class Loja:
  def __init__(self):
      self.veiculos = []
  def adicionar_veiculo(self, veiculo):
      self.veiculos.append(veiculo)
  def buscar_veiculos(self, marca=None, modelo=None, ano=None, direcao=None, ar_condicionado=None):
      resultados = []
      for veiculo in self.veiculos:
          if marca and veiculo.marca != marca:
              continue
          if modelo and veiculo.modelo != modelo:
              continue
          if ano and veiculo.ano != ano:
              continue
          if direcao is not None and veiculo.direcao != direcao:
              continue
          if ar_condicionado is not None and veiculo.ar_condicionado != ar_condicionado:
              continue
          resultados.append(veiculo)
      return resultados
    
class Contrato:
  def __init__(self, cliente, veiculo, dias_aluguel):
      self.cliente = cliente
      self.veiculo = veiculo
      self.dias_aluguel = dias_aluguel
  def gerar_contrato(self):
      print("=== Contrato de Aluguel UniDrive ===")
      print(f"Cliente: {self.cliente['nome']}")
      print(f"Veículo: {self.veiculo.marca} {self.veiculo.modelo}")
      print(f"Endereço: {self.cliente['endereco']}")
      print(f"Telefone: {self.cliente['telefone']}")
      print(f"Período de Aluguel: {self.dias_aluguel} dias")
      print("Valores:")
      # Adicionar lógica para cálculo de valores de aluguel
      print(f"Contrato enviado para {self.cliente['email']} cadastrado.")
def main():
  loja = Loja()
  
  print("Bem-vindo ao UniDrive, seu app de mobilidade universitária.")

  cliente_existente = input("Você já possui cadastro conosco? (sim/não): ")
  if cliente_existente.lower() == "nao":
      cpf = input("Para se cadastrar, informe seu CPF: ")
      nome = input("Informe seu nome: ")
      nascimento = input("Informe sua data de nascimento: ")
      endereco = input("Informe seu endereço: ")
      email = input("Informe seu email: ")
      telefone = input("Informe seu telefone: ")
      cartao = input("Informe os dados do seu cartão: ")

      cliente1 = Cliente()
      cliente1.cadastrar(cpf, nome, nascimento, endereco, email, telefone, cartao)

  dias_aluguel = int(input("Quantos dias você deseja alugar um carro? "))

  loja = Loja()
  # Adicionar veículos à loja

  print("\nVeículos disponíveis para aluguel:")
  for veiculo in loja.veiculos:
      print(f"{veiculo.marca} {veiculo.modelo} - {veiculo.ano}")

  filtro_marca = input("\nFiltrar por marca (deixe em branco para ignorar): ")
  filtro_modelo = input("Filtrar por modelo (deixe em branco para ignorar): ")
  filtro_ano = input("Filtrar por ano (deixe em branco para ignorar): ")
  # Adicionar mais filtros conforme necessário

  veiculos_filtrados = loja.buscar_veiculos(marca=filtro_marca, modelo=filtro_modelo, ano=filtro_ano)

  print("\nVeículos que correspondem aos filtros:")
  for veiculo in veiculos_filtrados:
      print(f"{veiculo.marca} {veiculo.modelo} - {veiculo.ano}")

  if veiculos_filtrados:
      escolha_veiculo = int(input("\nEscolha o número do veículo desejado: "))
      veiculo_escolhido = veiculos_filtrados[escolha_veiculo]

      # Supondo que o cliente seja o mesmo que se cadastrou (pode ser modificado conforme necessidade)
      cliente = cliente1.clientes[cpf]
      contrato = Contrato(cliente, veiculo_escolhido, dias_aluguel)
      contrato.gerar_contrato()
if __name__ == "__main__":
  main()


''' veiculos disponiveis e suas especificacoes'''

veiculo = [
    {'marca': 'Chevrolet', 'modelo': 'Cruze', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.8', 'local': 'Centro'},
    {'marca': 'Chevrolet', 'modelo': 'Cruze', 'ano': 2022, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'Centro'},
    {'marca': 'Peugeout', 'modelo': '208', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'azul', 'motor': '1.0', 'local': 'Centro'},
    {'marca': 'Peugeout', 'modelo': '208', 'ano': 2022, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'branca', 'motor': '1.3', 'local': 'Centro'},
    {'marca': 'Peugeout', 'modelo': '308', 'ano': 2014, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.0', 'local': 'Centro'},
    {'marca': 'Honda', 'modelo': 'HRV', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'cinza', 'motor': '1.3', 'local': 'Centro' },
    {'marca': 'Honda', 'modelo': 'CRV', 'ano': 2018, 'direcao': 'maual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'Centro' }
]

