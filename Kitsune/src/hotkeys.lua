function initializeHotkeys()
	node=NDB.newMemNodeDatabase()
	node.nome = "Rolagem";
	node.dados = 1;
	node.mod = 0;
	node.sorte = 0;
	node.desejo = 0;
	node.vantagem = 0;
	node.falhasOponente = 0;
	NDB.createChildNode(node, "buffs");
	return node;
end

function editActionRoll(node, dados, mod, sorte, buffs, personagem, msg)
	node.nome = msg;
	node.dados = dados;
	node.mod = mod;
	node.sorte = sorte;

	if(buffs ~= nil) then
		listaBuffs = NDB.getChildNodes(buffs);
		if(listaBuffs ~= nil) then
			for _, buff in pairs(listaBuffs) do
				if(buff ~= nil and buff.ativo == true and (buff.formula ~= nil or buff.vantagem ~= nil) and buff.nome ~= nil) then
					nBuff = NDB.createChildNode(node.buffs, buff.nome);
					nBuff.ativo = buff.ativo
					nBuff.nome = buff.nome
					parsedF = parseFormula(buff.formula, personagem);
					nBuff.formula = parsedF
					nBuff.vantagem = buff.vantagem				
				end
			end
		end
	end

	 parseFormula("1D100 + [Ataque] + [Magia]", personagem);
end

function parseFormula(formula, personagem)
	result = formula
	for s in formula:gsub('%[[^%]]+%]','\0%0\0'):gsub('%z%z',''):gmatch'%z(.-)%z' do
		attribute = string.sub(s, 2, string.len(s) - 1)
		escapedS = "%[" .. attribute .. "%]"
		attrValueForChat = getAttrFromChat(personagem ,attribute)
		result = string.gsub(result, escapedS, attrValueForChat) 
	end
	return result
end

function getAttrFromChat(personagem, attribute)

	if (personagem ~= nil and personagem.atributos ~= nil) then
		if(attribute == "PV" and personagem.atributos.vidaAtual) then
			return personagem.atributos.vidaAtual;
		elseif(attribute == "PM" and personagem.atributos.recursoAtual) then
			return personagem.atributos.recursoAtual;
		elseif(attribute == "recurso" and personagem.atributos.recurso) then
			return personagem.atributos.recurso;
		elseif(attribute == "vida" and personagem.atributos.vida) then
			return personagem.atributos.vida;
		elseif(attribute == "Resistência Mágica" and personagem.atributos.resistenciaMagica) then
			return personagem.atributos.resistenciaMagica;
		elseif(attribute == "Magia" and personagem.atributos.magia) then
			return personagem.atributos.magia;
		elseif(attribute == "Sorte" and personagem.atributos.sorte) then
			return personagem.atributos.sorte;
		elseif(attribute == "Agilidade" and personagem.atributos.agilidade) then
			return personagem.atributos.agilidade;
		elseif(attribute == "Defesa" and personagem.atributos.defesa) then
			return personagem.atributos.defesa;
		elseif(attribute == "Ataque" and personagem.atributos.ataque) then
			return personagem.atributos.ataque;
		end
	
	end
	return 0			
end

function customRoll( sheet )

	if(sheet == nil) then
		sheet = initializeHotkeys();
	end

	if(sheet.dados == nil)then
		sheet.dados = 1;
	end

	local modNumber = tonumber(sheet.mod);
	if(modNumber ~= nil)then		
		if(modNumber > 0)then
			mod = "+"..modNumber;
		elseif(modNumber < 0)then
			mod = modNumber;
		else
			mod = "";
		end
	end

	rolagem = sheet.dados .. "D100" .. mod;

	vantagem = sheet.vantagem;
	if(sheet.buffs ~= nil) then
		listaBuffs = NDB.getChildNodes(sheet.buffs);
		if(listaBuffs ~= nil) then
			for key, buff in pairs(listaBuffs) do
				if(buff ~= nil and buff.ativo == true) then
					if(buff.formula ~= nil) then
						rolagem = concatanateRollsToText(rolagem, buff.formula)				
					end
					if(buff.vantagem ~= nil and buff.vantagem > 0) then
						vantagem = vantagem + buff.vantagem;					
					end
				end
			end
		end
	end
	mesa = getMesa(sheet);
	rollTeste2(rolagem, sheet.sorte, vantagem, sheet.desejo, sheet.falhasOponente, mesa,sheet.objetivo, sheet.nome);	
end

function isValidRoll( rolagem )
	local rolagemCheck = Firecast.interpretarRolagem(rolagem);
	return #rolagemCheck.ops > 0;
end

function concatanateRollsToText( rolagem1, rolagem2 )
	local roll1 = Firecast.interpretarRolagem(rolagem1);
	local roll2 = Firecast.interpretarRolagem(rolagem2);

	msg = ""
	if(#roll1.ops > 0) then
		msg = getRollText(roll1)
	end
	if(#roll2.ops > 0) then
		if (#roll1.ops > 0) then
			msg = msg .. " ";
			if (roll2.ops[1].tipo == "dado") then
				msg = msg .. "+"
			end
		end
		msg = msg .. getRollText(roll2)
	end
	return msg;
end

function getRollText( rolagem )
	local msg = "";
	for i = 1, #rolagem.ops, 1 do  
        local operacao = rolagem.ops[i];      
        -- Vamos verificar que tipo de operação é esta.      
        if operacao.tipo == "dado" then        
            msg = msg .. operacao.quantidade .. "d" .. operacao.face; 
        elseif operacao.tipo == "imediato" and i == 1 then
        	msg = msg .. "+" .. operacao.valor;
        elseif operacao.tipo == "imediato" then
        	msg = msg .. operacao.valor;
        elseif operacao.tipo == "subtracao" then
            msg = msg .. "-";
         elseif operacao.tipo == "soma" then
            msg = msg .. "+";
        end;
	end; 
	return msg;
end