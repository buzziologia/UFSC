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
          print("===========================UniDrive===========================")
      else:
          print("Usuária(o) já possui cadastro.")
  def coletar_dados_cartao(self, cpf):
      if cpf in self.clientes:
          return self.clientes[cpf]['cartao']
      else:
          return "Cliente não encontrado."

class Veiculo:
  def __init__(self, marca, modelo, ano, direcao, ar_condicionado, cor, motor, local, diaria, codigo):
      self.marca = marca
      self.modelo = modelo
      self.ano = ano
      self.direcao = direcao
      self.ar_condicionado = ar_condicionado
      self.cor = cor
      self.motor = motor
      self.local = local
      self.diaria = diaria
      self.codigo = codigo #uma ideia é que o codigo seja com base nos atributos do carro MMADCML - Primeira letra do modelo, da marca, ultimo digito do ano, A ou M da direcao, primeira letra da cor, ultimo digito do motor e primeira letra do local
    
# Corrigindo a classe Loja para inicializar a lista de veículos
class Loja:
  def __init__(self):
      self.veiculos = []
  def adicionar_veiculo(self, veiculo):
      self.veiculos.append(veiculo)
  def filtrar_veiculos(self, **kwargs):
      resultado = []
      for veiculo in self.veiculos:
          match = True
          for key, value in kwargs.items():
              if value and veiculo.get(key) != value:
                  match = False
                  break
          if match:
              resultado.append(veiculo)
      return resultado

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
      # Adicionar lógica para cálculo de valores de aluguel e taxas
      print(f"Contrato enviado para {self.cliente['email']} cadastrado.")


#-------------------------inicio do programa------------------------------
try_again = True
while try_again:
  print("===========================UniDrive===========================")
  print("Bem-vindo ao UniDrive, seu app de mobilidade universitária.")
  print("Aqui você pode alugar veículos para sua viagem.")
  print("===========================UniDrive===========================")  
  cliente_colaborador = input("Identifique-se para começar. (Colaborador ou Cliente): ")
  if cliente_colaborador.lower() == "colaborador":
    print("Bem-vindo colaborador! Você é um colaborador da UniDrive.")
    cadastrar_veiculo = input("Deseja cadastrar um veículo? (sim ou não): ")
    if cadastrar_veiculo.lower() == "sim":
      marca = input("Digite a marca do veículo: ")
      modelo = input("Digite o modelo do veículo: ")
      ano = input("Digite o ano do veículo: ")
      direcao = input("Digite a direção do veículo: ")
      ar_condicionado = input("O veículo possui ar-condicionado? (sim ou não): ")
      cor = input("Digite a cor do veículo: ")
      motor = input("Digite o motor do veículo: ")
      local = input("Digite a unidade da locadora do veículo: ")
      diaria = input("Digite o valor da diária do veículo: ")
      veiculo = Veiculo(marca, modelo, ano, direcao, ar_condicionado, cor, motor, local, diaria)
      loja.adicionar_veiculo(veiculo)
      print("Veículo cadastrado com sucesso!")
      try_again = False
    else:
      print("Ok, obrigado por usar nosso app.")
      try_again = True
    print("=============================================================")
  if cliente_colaborador.lower() == "cliente":
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
  else:
    print("Opção inválida. Tente novamente.")
    try_again = True
    
    
  print("Estamos aguardando sua visita! Por favor, prosiga o cadastro do aluguel.")
  filtro_marca = input("Filtrar por marca (deixe em branco para ignorar): ")
  filtro_modelo = input("Filtrar por modelo (deixe em branco para ignorar): ")
  filtro_ano = input("Filtrar por ano (deixe em branco para ignorar): ")
  filtro_direcao = input("Filtrar por direção (deixe em branco para ignorar): ")
  filtro_ar = input("Filtrar por ar-condicionado (deixe em branco para ignorar): ")
  filtro_cor = input("Filtrar por cor (deixe em branco para ignorar): ")
  filtro_motor = input("Filtrar por motor (deixe em branco para ignorar): ")
  filtro_local = input("Filtrar por locadora Centro ou Trindade (deixe em branco para ignorar): ")
  filtro_diaria = input("Filtrar por diária (deixe em branco para ignorar): ")
  filtro_codigo = 
  # Convertendo o ano para int se não estiver vazio
  if filtro_ano:
      filtro_ano = int(filtro_ano)

  # Criando um objeto da classe Loja
  loja = Loja()

  # Adicionando veículos à loja
  veiculos = [
    {'marca': 'chevrolet', 'modelo': 'cruze', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.8', 'local': 'centro', 'diaria': 'R$200,00', 'codigo': 'CC0ASP8C'},
    {'marca': 'chevrolet', 'modelo': 'cruze', 'ano': 2022, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'centro', 'diaria': 'R$150,00', 'codigo': 'CC2MSB0C' },
    {'marca': 'peugeout', 'modelo': '208', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'azul', 'motor': '1.0', 'local': 'centro', 'diaria': 'R$100,00', 'codigo': 'P28MSA0C'},
    {'marca': 'peugeout', 'modelo': '208', 'ano': 2022, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'branca', 'motor': '1.3', 'local': 'centro', 'diaria': 'R$150,00', 'codigo': 'P22ASB3C'},
    {'marca': 'peugeout', 'modelo': '308', 'ano': 2014, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.0', 'local': 'centro', 'diaria': 'R$100,00', 'codigo': 'P3MSP0C'},
    {'marca': 'honda', 'modelo': 'hrv', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'cinza', 'motor': '1.3', 'local': 'centro', 'diaria': 'R$200,00', 'codigo': 'HH0ASC3C'},
    {'marca': 'honda', 'modelo': 'crv', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'centro', 'diaria': 'R$100,00', 'codigo': 'HC8MSB0C'}
  ]
  for veiculo in veiculos:
      loja.adicionar_veiculo(veiculo)

  # Filtrando os veículos com base nos critérios do usuário
  veiculos_filtrados = loja.filtrar_veiculos(marca=filtro_marca, modelo=filtro_modelo, ano=filtro_ano, direcao=filtro_direcao, ar_condicionado=filtro_ar, cor=filtro_cor, motor=filtro_motor, local=filtro_local, diaria=filtro_diaria)

  # Imprimindo os veículos filtrados
  for veiculo in veiculos_filtrados:
      print("===========================UniDrive===========================")
      print(veiculo)
  
  print("Essas são todas nossas opcões de veículos. Escolha o que deseja alugar.")
  print("===========================UniDrive===========================")
  alugar_veiculo = input("Deseja alugar um veículo? (sim ou não): ")
  if alugar_veiculo.lower() == "sim":
    cpf = input("Informe seu CPF: ")
    cartao = input("Informe os dados do seu cartão: ")
    cliente = Cliente()
    cliente_dados = cliente.coletar_dados_cartao(cpf)
    if cliente_dados == "Cliente não encontrado.":
      print("Cliente não encontrado. Por favor, cadastre-se.")
      nome = input("Informe seu nome: ")
      nascimento = input("Informe sua data de nascimento: ")
      endereco = input("Informe seu endereço: ")
      email = input("Informe seu email: ")
      telefone = input("Informe seu telefone: ")
      cartao = input("Informe os dados do seu cartão: ")
      cliente1 = Cliente()
      cliente1.cadastrar(cpf, nome, nascimento, endereco, email, telefone, cartao)
    else:
      print("Cliente encontrado. Prossiga com o aluguel.")
    dias_aluguel = int(input("Quantos dias você deseja alugar? "))
    veiculo_escolhido = input("Informe o codigo do veículo que deseja alugar: ")
    veiculo_escolhido = loja.filtrar_veiculos(codigo=veiculo_escolhido)
    if veiculo_escolhido:
      veiculo_escolhido = veiculo_escolhido[0]
      contrato = Contrato(cliente_dados, veiculo_escolhido, dias_aluguel)
      contrato.gerar_contrato()
      print("Contrato gerado com sucesso!")
      
    
                      
    
  
