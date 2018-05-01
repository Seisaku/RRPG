function lerBiblioteca(sheet)
	if(sheet~=nil) then
		local mesa = rrpg.getMesaDe(sheet);
		biblioteca = mesa.biblioteca;
		for key,item in pairs(biblioteca.filhos) do
			mesa.activeChat:enviarMensagem(item.nome);
		end
	end
end

function populateRace(races,name,bonusAtq,bonusDef,bonusAgi,bonusMag,bonusResM,bonusSor,desloc,tamanho,listaIdiomas,listaSubracas)
	initRace(races);
	race.deslocamento = desloc;
	race.bonus.ataque = bonusAtq;
	race.bonus.defesa = bonusDef;
	race.bonus.agilidade = bonusMag;
	race.bonus.resistencia_magica = bonusResM;
	race.bonus.sorte = bonusSor;
	race.tamanho = tamanho;
end


function getRaces()
	if races == nil then
		races = ndb.newMemNodeDatabase();
	end
	return races;
end

function testaRaces()
	showMessage("START testaRaces");
	races = getRaces();
	listaChilds = ndb.getChildNodes(races);
	for key,child in pairs(listaChilds) do
		showMessage(ndb.getNodeName(child));		
	end
	showMessage("END testaRaces");
end

function testChat(sheet)
	local mesa = rrpg.getMesaDe(sheet);
	mesa.activeChat:enviarMensagem("Testing chat send message");
end



function testNodes(database)
	require("ndb.lua");
	local mesa = rrpg.getMesaDe(database);
	mesa.activeChat:enviarMensagem("START TEST");
	mesa.activeChat:enviarMensagem("Database " .. ndb.getNodeName(database));
		
	local childs = ndb.getChildNodes(database);
	mesa.activeChat:enviarMensagem("Database Children " );
	for key, node in pairs(childs) do
		mesa.activeChat:enviarMensagem(ndb.getNodeName(node));
	end
	mesa.activeChat:enviarMensagem("Sheet Children " );
	local childs2 = ndb.getChildNodes(childs["1"]);
	for key, node in pairs(childs2) do
		mesa.activeChat:enviarMensagem(ndb.getNodeName(node));
	end
	mesa.activeChat:enviarMensagem("Attributes Children" );
	local childs3 = ndb.getChildNodes(childs2["1"]);
	for key, node in pairs(childs3) do
		mesa.activeChat:enviarMensagem(ndb.getNodeName(node));
	end
	mesa.activeChat:enviarMensagem("Attributes Attributes" );
	local attrs3 = ndb.getAttributes(childs2["1"]);
	for key, value in pairs(attrs3) do
		mesa.activeChat:enviarMensagem(value);
	end
	mesa.activeChat:enviarMensagem("test1 Attributes" );
	local attrs3 = ndb.getAttributes(childs2["2"]);
	for key, value in pairs(attrs3) do
		mesa.activeChat:enviarMensagem(value);
	end
	mesa.activeChat:enviarMensagem(database.sheet.atributos.nome);
	database.sheet.atributos.nome = database.sheet.atributos.nome .. "A"
	mesa.activeChat:enviarMensagem("END TEST");
end

function testSetDatabase(masakiform)
	require("ndb.lua");
	local nodoRaiz = ndb.load("orion.xml"); 
	masakiform:setNodeObject(nodoRaiz);
	nodoRaiz = masakiform:getNodeObject();

end

function testMsg()
	showMessage("TEST");
	end

function testReady(masakiform)
	showMessage("READY!");
	nodoRaiz = masakiform:getNodeObject();
	printAllChildren(nodoRaiz);
	child = ndb.getChildNodes(nodoRaiz)["1"];
	printAllChildren(child);
	printAllAttr(child);
	showMessage("END");
end

function printAllChildren(node)
	showMessage("printAllChildren");
	listaChilds = ndb.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		showMessage(key .. ndb.getNodeName(child));
	end
end

function printAllAttr(node)
	showMessage("printAllAttr");
	listaAttr = ndb.getAttributes(node);
	for key,Attr in pairs(listaAttr) do
		showMessage(key .. Attr);
	end
	showMessage("printAllAttr END");
end


tableTipoToClasse = {}

function getClasseFromTipo(tipo)
	local tableTipoToClasse = initTipoClasse();
	return tableTipoToClasse[tipo];
end

function initTipoClasse()
	local tableTipoToClasse={};
	tableTipoToClasse["Adaga"]="simplesC";
	tableTipoToClasse["Azagaia"]="simplesC";
	tableTipoToClasse["Bordao"]="simplesC";
	tableTipoToClasse["ClavaGrande"]="simplesC";
	tableTipoToClasse["FoiceCurta"]="simplesC";
	tableTipoToClasse["Lanca"]="simplesC";
	tableTipoToClasse["Maca"]="simplesC";
	tableTipoToClasse["Machadinha"]="simplesC";
	tableTipoToClasse["MarteloLeve"]="simplesC";
	tableTipoToClasse["Porrete"]="simplesC";
	tableTipoToClasse["ArcoCurto"]="simplesD";
	tableTipoToClasse["BestaLeve"]="simplesD";
	tableTipoToClasse["Dardo"]="simplesD";
	tableTipoToClasse["Funda"]="simplesD";
	tableTipoToClasse["Alabarda"]="marciaisC";
	tableTipoToClasse["Cimitarra"]="marciaisC";
	tableTipoToClasse["Chicote"]="marciaisC";
	tableTipoToClasse["EspadaCurta"]="marciaisC";
	tableTipoToClasse["EspadaGrande"]="marciaisC";
	tableTipoToClasse["EspadaLonga"]="marciaisC";
	tableTipoToClasse["Glaive"]="marciaisC";
	tableTipoToClasse["LancadeMontaria"]="marciaisC";
	tableTipoToClasse["LancaLonga"]="marciaisC";
	tableTipoToClasse["MacaEstrela"]="marciaisC";
	tableTipoToClasse["MachadoGrande"]="marciaisC";
	tableTipoToClasse["MachadodeBatalha"]="marciaisC";
	tableTipoToClasse["Malho"]="marciaisC";
	tableTipoToClasse["Mangual"]="marciaisC";
	tableTipoToClasse["MartelodeGuerra"]="marciaisC";
	tableTipoToClasse["PicaretadeGuerra"]="marciaisC";
	tableTipoToClasse["Rapieira"]="marciaisC";
	tableTipoToClasse["Tridente"]="marciaisC";
	tableTipoToClasse["ArcoLongo"]="marciaisD";
	tableTipoToClasse["BestadeMao"]="marciaisD";
	tableTipoToClasse["BestaPesada"]="marciaisD";
	tableTipoToClasse["Rede"]="marciaisD";
	tableTipoToClasse["Zarabatana"]="marciaisD";
	return tableTipoToClasse;
end


pendingRolls = {}

function rollTeste3(sheet, roll, sor, msg)
        id = uuid();
        data = sheet .. "|" .. roll .. "|" .. sor .. "|" .. msg
end


local random = math.random
local function uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

function rollTeste2(sheet, roll, sor, msg)
        local mesa = rrpg.getMesaDe(sheet);     
        local rolagem = rrpg.interpretarRolagem(roll);   
        mesa.activeChat:rolarDados(rolagem,msg, 
                function ( rolagem )
                        local dados = {};
                        local f;
                        local desc;
                        local sorte = sor;
                        local resultR = rolagem.resultado;
                        if sorte == nil then
                                sorte = 0;
                        else
                                sorte = sorte - 1;
                        end
                        local crit = 0;
                        local fail = 0;
                        for i = 1, #rolagem.ops, 1 do
                                local op = rolagem.ops[i];       
                                if op.tipo == "dado" then
                                        f = op.face;
                                        for j = 1, #op.resultados, 1 do
                                                if op.resultados[j] >= f-sorte then
                                                        crit = crit + 1;
                                                end
                                                if op.resultados[j] == 1 then
                                                        fail = fail + 1;
                                                end
                                        end;
                                end;
                        end;
                        if crit > 0 then
                                critroll = rrpg.interpretarRolagem(crit .. "d" .. f ..  "+" .. resultR);                                
                                mesa.activeChat:rolarDados(critroll,"Critico!!!");                           
                        end
                        if fail > 0 then
                                mesa.activeChat:enviarMensagem("Critical Fail!!! " .. fail);
                        end     
                end);       
end



function testBars( sheet )
	function changeBarraVida(sheet)
	jogador = rrpg.getCurrentUser();
	if(jogador~=nil) then
		jogador = getJogadorfromSheet(sheet);
		currentValue, maxValue , percent = jogador:getBarValue(1);
		showMessage(jogador.login .. currentValue .. maxValue .. percent);
	else
		showMessage("FAIL");
		parent1 = ndb.getNodeName(ndb.getParent(sheet));
		printAllChildren(parent1);
		parent2 = ndb.getNodeName(ndb.getParent(sheet));
		printAllChildren(parent2);
	end
	personagem = rrpg.getBibliotecaItemDe(sheet);
	if(personagem ~= nil) then
		showMessage(personagem.avatar);
	else
		showMessage("FAIL");
	end
end
end