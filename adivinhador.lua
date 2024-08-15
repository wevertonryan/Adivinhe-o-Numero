--JOGO ADIVINHE O NÚMERO - PROGRAMAÇÃO FEITA POR WEVERTON RYAN
-- Meu primeiro jogo de texto feito em Lua, espero que goste

--Função esperar(tempo)
function wait(t)
  local time = os.time() + t
  repeat until os.time() >= time
end

--Mensagem de Boas Vindas ao jogadores
function introducao()
  print(" [[ADIVINHE O NÚMERO]]\n")
  wait(2)
  print(" Olá, bem vindo ao jogo Adivinhe o Número por Weverton Ryan.\n")
  wait(2)
end

--Para os novos jogadores uma explicação sobre o que é o jogo
function manual()
    print(" Deseja uma explicação do Jogo?\n(Sim/Não)")
    local resp = io.read():lower() --resposta do jogador
    if resp == "sim" or resp == "s" then
      print("\n Ok, no jogo Adivinhe o Número, um número aleatório de 1 a 100 será gerado, sua missão é tentar adivinhar este número, caso erre direi se o valor que você chutou está para baixo ou para cima do valor real, tente acertar com o menor número de tentativas possíveis!\n")
      print("Agora, após essa explicação, podemos começar!!!")
    else
      print("Certo, então vamos começar!!!")
    end
  wait(2)
end

--O código do jogo em sí
function jogo()
  local num = math.random(1,100) --número gerado aleatóriamente de 1 a 100
  tent = 0 --variável das tentativas
  repeat
    print("\nChute o valor de um Número")
    local resp = tonumber(io.read()) --resposta do jogador, sendo transformada para número, pois é recebida como string
    if type(resp) == "number" then --verificação se a variavel é realmwnte número
      if resp == num then
        print(" -Você Acertou!!!")
      elseif resp > num then
        print(" -Valor muito alto.")
      elseif resp < num then
        print(" -Valor muito baixo.")
      end
      tent = tent + 1
    else --caso não seje número
      print(" -Resposta inválida")
    end
  until resp == num
end

--Mensagem de fim de jogo + restart do jogo
function fim()
  print("Parabens, você ganhou com " .. tent .. " tentativas.")
  wait(2)
  print("Que tentar novamente? (Sim/Não)")
  local resp = io.read():lower() --resposta do jogador
  if resp == "sim" or resp == "Sim" or resp == "s" then
    print("\nOk, vamos começar novamente")
    wait(2)
    reset = true
  else
    print("\n[[FIM DE JOGO]]")
    reset = false
  end
end

-- Sequecia de execução do Jogo
introducao()
manual()
repeat --Para o funcionamento do restart do jogo
jogo()
fim()
until reset == false

--Obrigado por ver meu Jogo