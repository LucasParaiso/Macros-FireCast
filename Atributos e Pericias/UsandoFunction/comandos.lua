function atributosNPC()
    local indice, a = choose("Escolha um Atributo:", {"Iniciativa", "Destreza", "Constinuição", "Inteligência", "Sabedoria", "Carisma", "Força"}, 1);

    local modificador, rolagem, dado, dados, mensagem;

    local discreta = confirmYesNo("Deseja rolar de forma Discreta?");

    local personagens = chooseCharacters("Escolha um NPC", "npc");

    for i = 1, #personagens, 1 do
        dados = getCharacterSheet(personagens[i]);

        if indice == 1 then modificador = tonumber(dados.iniciativa);
        elseif indice == 2 then modificador = dados.atributos.moddestreza;
        elseif indice == 3 then modificador = dados.atributos.modconstituicao;
        elseif indice == 4 then modificador = dados.atributos.modinteligencia;
        elseif indice == 5 then modificador = dados.atributos.modsabedoria;
        elseif indice == 6 then modificador = dados.atributos.modcarisma;
        elseif indice == 7 then modificador = dados.atributos.modforca;
        end;

    if modificador < 0 then
        rolagem  = rolarLocal("1d20" .. modificador);

        modificador = modificador * (-1);

        dado = rolagem + modificador;

        mensagem = ("1d20 - " .. modificador .. " = " .. rolagem .. " {[" .. dado .. "] - " .. modificador .. "} - " .. a);
    else
        rolagem = rolarLocal("1d20+" .. modificador);

        dado = rolagem - modificador;

        mensagem = ("1d20 + " .. modificador .. " = " .. rolagem .. " {[" .. dado .. "] + " .. modificador .. "} - " .. a);
    end;

    if (discreta) then
        showMessage(personagens[i].nome .. ": " .. mensagem);
    else
        sendNPC(personagens[i].nome, mensagem);
    end;

    end;
end

function periciasNPC()
    local indice, a = choose("Escolha uma pericia:", {"Atletismo","Acrobacia","Furtividade","Prestidigitação","Arcanismo","História","Investigação","Natureza","Religião","Adestrar Animais","Intuição","Medicina","Percepção","Sobrevivência","Atuação","Enganação","Intimidação", "Persuasão"}, 1);

    local modificador;
    local rolagem;
    local dado;
    local dados;
    local mensagem;

    local personagens = chooseCharacters("Escolha um NPC", "npc");

    local discreta = confirmYesNo("Deseja rolar de forma Discreta?");

    for i = 1, #personagens, 1 do
        dados = getCharacterSheet(personagens[i]);

        if indice == 1 then modificador = dados.pericias.bonusatletismo;
        elseif indice == 2 then modificador = dados.pericias.bonusacrobacia;
        elseif indice == 3 then modificador = dados.pericias.bonusfurtividade;
        elseif indice == 4 then modificador = dados.pericias.bonusprestidigitacao;
        elseif indice == 5 then modificador = dados.pericias.bonusarcanismo;
        elseif indice == 6 then modificador = dados.pericias.bonushistoria;
        elseif indice == 7 then modificador = dados.pericias.bonusinvestigacao;
        elseif indice == 8 then modificador = dados.pericias.bonusnatureza;
        elseif indice == 9 then modificador = dados.pericias.bonusreligiao;
        elseif indice == 10 then modificador = dados.pericias.bonusadestrarAnimais;
        elseif indice == 11 then modificador = dados.pericias.bonusintuicao;
        elseif indice == 12 then modificador = dados.pericias.bonusmedicina;
        elseif indice == 13 then modificador = dados.pericias.bonuspercepcao;
        elseif indice == 14 then modificador = dados.pericias.bonussobrevivencia;
        elseif indice == 15 then modificador = dados.pericias.bonusAauacao;
        elseif indice == 16 then modificador = dados.dados.pericias.bonusenganacao;
        elseif indice == 17 then modificador = dados.pericias.bonusintimidacao;
        elseif indice == 18 then modificador = dados.pericias.bonuspersuasao;
        end;

    if modificador < 0 then
        rolagem  = rolarLocal("1d20" .. modificador);

        modificador = modificador * (-1);

        dado = rolagem + modificador;

        mensagem = ("1d20 - " .. modificador .. " = " .. rolagem .. " {[" .. dado .. "] - " .. modificador .. "} - " .. a);
    else
        rolagem = rolarLocal("1d20+" .. modificador);

        dado = rolagem - modificador;

        mensagem = ("1d20 + " .. modificador .. " = " .. rolagem .. " {[" .. dado .. "] + " .. modificador .. "} - " .. a);
    end;

    if (discreta) then
        local enviar = personagens[i].nome .. ": " .. mensagem;
        showMessage(enviar);
    else
        sendNPC(personagens[i].nome, mensagem);
    end;

    end;
end

function NPC()
    local escolha, qualquer = choose("Escolha:", {"Atributos", "Pericias"}, 1);

    if escolha == 1 then
        atributosNPC()
    else
        if escolha == 2 then
            periciasNPC()
        end;
    end;
end

function atributosPlayer()
    local indice, a = choose("Escolha um Atributo:", {"Iniciativa", "Força", "Destreza", "Constinuição", "Inteligência", "Sabedoria", "Carisma"}, 1);

    local modificador;

    if indice == 1 then modificador = tonumber(sheet.iniciativa);
        elseif indice == 2 then modificador = sheet.atributos.modforca;
        elseif indice == 3 then modificador = sheet.atributos.moddestreza;
        elseif indice == 4 then modificador = sheet.atributos.modconstituicao;
        elseif indice == 5 then modificador = sheet.atributos.modinteligencia;
        elseif indice == 6 then modificador = sheet.atributos.modsabedoria;
        elseif indice == 7 then modificador = sheet.atributos.modcarisma;
        end;

    if modificador < 0 then
        rolar("1d20" .. modificador, a);
    else
        rolar("1d20+" .. modificador, a);    
    end;
end

function periciasPlayer()
    local indice, a = choose("Escolha uma pericia:", {"Atletismo","Acrobacia","Furtividade","Prestidigitação","Arcanismo","História","Investigação","Natureza","Religião","Adestrar Animais","Intuição","Medicina","Percepção","Sobrevivência","Atuação","Enganação","Intimidação", "Persuasão"}, 1);

    local modificador;
    local rolagem;
    local dado;
    local dados;
    local mensagem;

    if indice == 1 then modificador = sheet.pericias.bonusatletismo;
    elseif indice == 2 then modificador = sheet.pericias.bonusacrobacia;
    elseif indice == 3 then modificador = sheet.pericias.bonusfurtividade;
    elseif indice == 4 then modificador = sheet.pericias.bonusprestidigitacao;
    elseif indice == 5 then modificador = sheet.pericias.bonusarcanismo;
    elseif indice == 6 then modificador = sheet.pericias.bonushistoria;
    elseif indice == 7 then modificador = sheet.pericias.bonusinvestigacao;
    elseif indice == 8 then modificador = sheet.pericias.bonusnatureza;
    elseif indice == 9 then modificador = sheet.pericias.bonusreligiao;
    elseif indice == 10 then modificador = sheet.pericias.bonusadestrarAnimais;
    elseif indice == 11 then modificador = sheet.pericias.bonusintuicao;
    elseif indice == 12 then modificador = sheet.pericias.bonusmedicina;
    elseif indice == 13 then modificador = sheet.pericias.bonuspercepcao;
    elseif indice == 14 then modificador = sheet.pericias.bonussobrevivencia;
    elseif indice == 15 then modificador = sheet.pericias.bonusAauacao;
    elseif indice == 16 then modificador = sheet.sheet.pericias.bonusenganacao;
    elseif indice == 17 then modificador = sheet.pericias.bonusintimidacao;
    elseif indice == 18 then modificador = sheet.pericias.bonuspersuasao;
    end;

    if modificador < 0 then
        rolar("1d20" .. modificador, a);
    else
        rolar("1d20+" .. modificador, a);    
    end;
end

function lag()
    rolar("300d4");
    rolar("300d6");
    rolar("300d8");
    rolar("300d10");
    rolar("300d12");
    rolar("300d20");
    rolar("300d100");
end

function discreta()
    local modificador = inputQuery("Digite o Modificador (com o '+/-')")

    modificador = tonumber(modificador)

    if modificador < 0 then
        local rolagem = rolarLocal("1d20" .. modificador)

        modificador = modificador * (-1)

        local dado = rolagem + modificador

        showMessage("1d20 - " .. modificador .. " = " .. rolagem .. " {[" .. dado .. "] - " .. modificador .. "}")
    else
        local rolagem = rolarLocal("1d20+" .. modificador)

        local dado = rolagem - modificador

        showMessage("1d20 + " .. modificador .. " = " .. rolagem .. " {[" .. dado .. "] + " .. modificador .. "}")
    end
end

function apresentacao()
    local personagem = myCharacter.nome

    send("===========================");
    send("Olá! Me chamo:"); 
    send(personagem);
    send("===========================");
end

local indice, texto = choose("Escolha um Atributo:", {"NPC", "Atributos", "Pericias", "Gerar Lag", "Rolar dado discreto", "Apresentação"}, 1);

if indice == 1 then NPC();
elseif indice == 2 then atributosPlayer();
elseif indice == 3 then periciasPlayer();
elseif indice == 4 then lag();
elseif indice == 5 then discreta();
elseif indice == 6 then apresentacao();
end;
