class Cliente:
  def __init__ (self, nome, cpf, nascimento, endereco, email, telefone, cartao):
    self.nome = nome
    self.cpf = cpf
    self.nascimento = nascimento
    self.endereco = endereco
    self.email = email
    self.telefone = telefone
    self.cartao = cartao
    
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
      self.codigo = codigo

# Corrigindo a classe Loja para inicializar a lista de veículos
class Loja:
  def __init__(self):
      self.veiculos = []
      self.clientes = []
  
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
    
  def cadastrar(self, nome, cpf, nascimento, endereco, email, telefone, cartao):
    for cliente in self.clientes:
        if cliente.cpf == cpf:
            print("Cliente já cadastrado.")
            return cliente

    novo_cliente = Cliente(nome, cpf, nascimento, endereco, email, telefone, cartao)
    self.clientes.append(novo_cliente)
    print(f"Cliente {nome} cadastrado com sucesso!")
    return novo_cliente

  def coletar_dados_cartao(self, cpf):
    for cliente in self.clientes:
        if cliente.cpf == cpf:
            return cliente.nome, cliente.cpf, cliente.nascimento, cliente.endereco, cliente.email, cliente.telefone, cliente.cartao	  
    return "Cliente não encontrado."


class Contrato:
  def __init__(self, clientes, veiculos, dias_aluguel):
      self.cliente = clientes
      self.veiculo = veiculos
      self.dias_aluguel = dias_aluguel

  def calcular_valor_total(self):
      valor_diaria = self.veiculo['diaria']
      seguro = valor_diaria * 0.1
      limpeza = valor_diaria * 0.055
      valor_total = (valor_diaria + seguro + limpeza) * self.dias_aluguel
      return seguro, limpeza, valor_total

  def gerar_contrato(self):
      seguro, limpeza, valor_total = self.calcular_valor_total()

      print("======================== CONTRATO ALUGUEL UNIDRIVE ========================")
      print()
      if isinstance(self.cliente, dict):
          nome = self.cliente.get('nome', 'Cliente')
          cpf = self.cliente.get('cpf', 'CPF não encontrado')
          endereco = self.cliente.get('endereco', 'Endereço não encontrado')
          telefone = self.cliente.get('telefone', 'Telefone não encontrado')
          email = self.cliente.get('email', 'E-mail não encontrado')
      else:
          nome, cpf, endereco, telefone, email = 'Cliente', 'CPF não encontrado', 'Endereço não encontrado', 'Telefone não encontrado', 'E-mail não encontrado'

      print(f"Cliente........................: {nome}")
      print(f"CPF............................: {cpf}")
      print(f"Endereço.......................: {endereco}")
      print(f"Telefone.......................: {telefone}")
      print(f"Marca/Modelo/Ano do veículo....: {self.veiculo.get('marca', 'Marca não encontrada')} {self.veiculo.get('modelo', 'Modelo não encontrado')} {self.veiculo.get('ano', 'Ano não encontrado')}")
      print(f"Período de Aluguel.............: {self.dias_aluguel} dias")
      print(f"Valor da diária................: R$ {self.veiculo.get('diaria', 0):.2f}")
      print()
      print("===================== ADICIONAIS OBRIGATÓRIOS UNIDRIVE ====================")
      print()
      print(f" Seguro do veículo.............: R$ {seguro:.2f}")
      print(f" Limpeza do veículo............: R$ {limpeza:.2f}")
      print()
      print("====================== INFORMAÇÃO DE PAGAMENTO ============================")
      print(f"Valor total do aluguel..........: R$ {valor_total:.2f}")
      print(f"Contrato enviado para {email} cadastrado.")
      print()
      print("UniDrive agradece a preferência!")


  

#-------------------------inicio do programa------------------------------
veiculos = [
  {'marca': 'chevrolet', 'modelo': 'cruze', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.8', 'local': 'centro', 'diaria': 200, 'codigo': 'CC0ASP8C'},
  {'marca': 'chevrolet', 'modelo': 'cruze', 'ano': 2022, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'centro', 'diaria': 150, 'codigo': 'CC2MSB0C'},
  {'marca': 'peugeot', 'modelo': '208', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'azul', 'motor': '1.0', 'local': 'centro', 'diaria': 100, 'codigo': 'P28MSA0C'},
  {'marca': 'peugeot', 'modelo': '208', 'ano': 2022, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'branca', 'motor': '1.3', 'local': 'centro', 'diaria': 150, 'codigo': 'P22ASB3C'},
  {'marca': 'peugeot', 'modelo': '308', 'ano': 2014, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.0', 'local': 'centro', 'diaria': 100, 'codigo': 'P3MSP0C'},
  {'marca': 'honda', 'modelo': 'hrv', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'cinza', 'motor': '1.3', 'local': 'centro', 'diaria': 200, 'codigo': 'HH0ASC3C'},
  {'marca': 'honda', 'modelo': 'crv', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'centro', 'diaria': 100, 'codigo': 'HC8MSB0C'},
  {'marca': 'toyota', 'modelo': 'corolla', 'ano': 2019, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'vermelho', 'motor': '1.6', 'local': 'centro', 'diaria': 180, 'codigo': 'TC019RH6C'},
  {'marca': 'toyota', 'modelo': 'hilux', 'ano': 2021, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '2.4', 'local': 'centro', 'diaria': 250, 'codigo': 'TH021PM2C'},
  {'marca': 'volkswagen', 'modelo': 'gol', 'ano': 2017, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'prata', 'motor': '1.0', 'local': 'centro', 'diaria': 120, 'codigo': 'VG017PS0C'},
  {'marca': 'chevrolet', 'modelo': 'cruze', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.8', 'local': 'trindade', 'diaria': 200, 'codigo': 'CC0ASP8T'},
  {'marca': 'chevrolet', 'modelo': 'cruze', 'ano': 2022, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'trindade', 'diaria': 150, 'codigo': 'CC2MSB0T'},
  {'marca': 'peugeot', 'modelo': '208', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'azul', 'motor': '1.0', 'local': 'trindade', 'diaria': 100, 'codigo': 'P28MSA0T'},
  {'marca': 'peugeot', 'modelo': '208', 'ano': 2022, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'branca', 'motor': '1.3', 'local': 'trindade', 'diaria': 150, 'codigo': 'P22ASB3T'},
  {'marca': 'peugeot', 'modelo': '308', 'ano': 2014, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '1.0', 'local': 'trindade', 'diaria': 100, 'codigo': 'P3MSP0T'},
  {'marca': 'honda', 'modelo': 'hrv', 'ano': 2020, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'cinza', 'motor': '1.3', 'local': 'trindade', 'diaria': 200, 'codigo': 'HH0ASC3T'},
  {'marca': 'honda', 'modelo': 'crv', 'ano': 2018, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'branco', 'motor': '1.0', 'local': 'trindade', 'diaria': 100, 'codigo': 'HC8MSB0T'},
  {'marca': 'toyota', 'modelo': 'corolla', 'ano': 2019, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'vermelho', 'motor': '1.6', 'local': 'trindade', 'diaria': 180, 'codigo': 'TC019RH6T'},
  {'marca': 'toyota', 'modelo': 'hilux', 'ano': 2021, 'direcao': 'automatica', 'ar_condicionado': 'sim', 'cor': 'preto', 'motor': '2.4', 'local': 'trindade', 'diaria': 250, 'codigo': 'TH021PM2T'},
  {'marca': 'volkswagen', 'modelo': 'gol', 'ano': 2017, 'direcao': 'manual', 'ar_condicionado': 'sim', 'cor': 'prata', 'motor': '1.0', 'local': 'trindade', 'diaria': 120, 'codigo': 'VG017PS0T'}
]

loja = Loja()
clientes = [
  {'nome' : 'Vinicios', 'cpf' : '12345678900', 'nascimento': '01/01/01', 'endereco': 'rua das flores', 'email': 'plsgq@example.com', 'telefone': '9988776655', 'cartao': '1234 5678 9012 3456'}
]
for cliente_info in clientes:
  loja.cadastrar(**cliente_info)

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
            diaria = int(input("Digite o valor da diária do veículo: "))
            codigo = input("Digite o código do veículo: ")
            veiculo = Veiculo(marca, modelo, ano, direcao, ar_condicionado, cor, motor, local, diaria, codigo)
            loja.adicionar_veiculo(veiculo)
            print("Veículo cadastrado com sucesso!")
            try_again = False
        else:
            print("Ok, obrigado por usar nosso app.")
            try_again = True
            print("=============================================================")
    elif cliente_colaborador.lower() == "cliente":
        cpf = input("Informe seu CPF: ")
        if any(cliente.cpf == cpf for cliente in loja.clientes):  # Verifica se o cliente está na lista de clientes da loja
            nome, cpf, nascimento, endereco, email, telefone, cartao = loja.coletar_dados_cartao(cpf)
            print(f"Olá, {nome}! Seu CPF é {cpf}.")
            print("Aqui está seu cadastro:")
            print(f"Nome: {nome}")
            print(f"CPF: {cpf}")
            print(f"Data de nascimento: {nascimento}")
            print(f"Endereço: {endereco}")
            print(f"E-mail: {email}")
            print(f"Telefone: {telefone}")
            print(f"Cartão: {cartao}")
            print("=============================================================")
           
          
        else:
          print("Cliente não encontrado. Por favor, cadastre-se.")
          nome = input("Informe o nome do cliente: ")
          nascimento = input("Informe a data de nascimento: ")
          endereco = input("Informe o endereço: ")
          email = input("Informe o email: ")
          telefone = input("Informe o telefone: ")
          cartao = input("Informe os dados do cartão: ")
          cliente_dados = loja.cadastrar(nome, cpf, nascimento, endereco, email, telefone, cartao)
          
    else:
        print("Opção inválida. Tente novamente.")
        try_again = True

    print("Estamos aguardando sua visita! Por favor, prossiga o cadastro do aluguel.")
    filtro_marca = input("Filtrar por marca (deixe em branco para ignorar): ")
    filtro_modelo = input("Filtrar por modelo (deixe em branco para ignorar): ")
    filtro_ano = input("Filtrar por ano (deixe em branco para ignorar): ")
    filtro_direcao = input("Filtrar por direção (deixe em branco para ignorar): ")
    filtro_ar = input("Filtrar por ar-condicionado (deixe em branco para ignorar): ")
    filtro_cor = input("Filtrar por cor (deixe em branco para ignorar): ")
    filtro_motor = input("Filtrar por motor (deixe em branco para ignorar): ")
    filtro_local = input("Filtrar por locadora Centro ou Trindade (deixe em branco para ignorar): ")
    filtro_diaria = input("Filtrar por diária (deixe em branco para ignorar): ")
    filtro_codigo = ""
    # Convertendo o ano para int se não estiver vazio
    if filtro_ano:
        filtro_ano = int(filtro_ano)

    
  

    for veiculo in veiculos:
        loja.adicionar_veiculo(veiculo)

    # Filtrando os veículos com base nos critérios do usuário
    veiculos_filtrados = loja.filtrar_veiculos(marca=filtro_marca, modelo=filtro_modelo, ano=filtro_ano,
                                                direcao=filtro_direcao, ar_condicionado=filtro_ar, cor=filtro_cor,
                                                motor=filtro_motor, local=filtro_local, diaria=filtro_diaria)

    # Imprimindo os veículos filtrados
    for veiculo in veiculos_filtrados:
        print("===========================UniDrive===========================")
        print(veiculo)

    print("Essas são todas nossas opções de veículos. Escolha o que deseja alugar.")
    print("===========================UniDrive===========================")
    codigo_escolhido = input("Digite o código do veículo que deseja alugar: ")
    veiculo_escolhido = None
    for veiculo in veiculos_filtrados:
        if veiculo['codigo'] == codigo_escolhido:
            veiculo_escolhido = veiculo
            break
    if veiculo_escolhido:
        print("Veículo encontrado!")
        print("===========================UniDrive===========================")
        print(f"Marca: {veiculo_escolhido['marca']}")
        print(f"Modelo: {veiculo_escolhido['modelo']}")
        print(f"Ano: {veiculo_escolhido['ano']}")
        print(f"Direção: {veiculo_escolhido['direcao']}")
        print(f"Ar-condicionado: {veiculo_escolhido['ar_condicionado']}")
        print(f"Cor: {veiculo_escolhido['cor']}")
        print(f"Motor: {veiculo_escolhido['motor']}")
        print(f"Local: {veiculo_escolhido['local']}")
        print(f"Diária: {veiculo_escolhido['diaria']}")
        print(f"Código: {veiculo_escolhido['codigo']}")
        print("===========================UniDrive===========================")
        print("Agora, informe os dados do cliente.")
        print("===========================UniDrive===========================")

        user_cpf = input("Informe o CPF do cliente para finalizar o aluguel: ")
        # Usando o mesmo CPF inserido para buscar o cliente na loja
        cliente_dados = loja.coletar_dados_cartao(user_cpf)

        if cliente_dados == "Cliente não encontrado.":
            print("Cliente não encontrado. Por favor, cadastre-se.")
            nome = input("Informe o nome do cliente: ")
            nascimento = input("Informe a data de nascimento: ")
            endereco = input("Informe o endereço: ")
            email = input("Informe o email: ")
            telefone = input("Informe o telefone: ")
            cartao = input("Informe os dados do cartão: ")
            cliente_dados = loja.cadastrar(nome, cpf, nascimento, endereco, email, telefone, cartao)
        else:
            print("Cliente encontrado. Prossiga com o aluguel.")
            nome, cpf, nascimento, endereco, email, telefone, cartao = cliente_dados
            cliente_dados = {
                'nome': nome,
                'cpf': cpf,
                'nascimento': nascimento,
                'endereco': endereco,
                'email': email,
                'telefone': telefone,
                'cartao': cartao
            }

        dias_aluguel = int(input("Quantos dias você deseja alugar? "))
        contrato = Contrato(cliente_dados, veiculo_escolhido, dias_aluguel)
        contrato.gerar_contrato()
        print("Contrato gerado com sucesso!")
